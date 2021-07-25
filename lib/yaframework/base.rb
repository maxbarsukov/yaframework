# frozen_string_literal: true

require "rack"

module Yaframework
  class Base
    attr_reader :routes, :request, :response, :env

    def initialize
      @routes = Hash.new([])
      @inbox = {}
    end

    %w[GET POST PATCH PUT DELETE HEAD OPTIONS].each do |verb|
      define_method :"#{verb.downcase}" do |path, &handler|
        add_route(verb, path, &handler)
      end
    end

    def call(env)
      @env = env
      @request  = Yaframework::Request.new @env
      @response = Yaframework::Response.new
      catch(:halt) { route_eval }
    end

    def halt(response)
      throw :halt, response
    end

    def handle(status, &block)
      @inbox[status] = block
    end

    def listen(port = 5000)
      Rack::Handler::WEBrick.run self, Port: port
    end

    private

    def add_route(verb, path, &handler)
      path = "/#{path}" unless path[0] == "/"
      @routes[verb] << compile(path, &handler)
    end

    def compile(path, &handler)
      route = { handler: handler, compiled_path: nil, extra_params: [], path: path }

      compiled_path = path.gsub(/:\w+/) do |match|
        route[:extra_params] << match.gsub(":", "").to_sym
        "([^/?#]+)"
      end
      route[:compiled_path] = /^#{compiled_path}$/
      route
    end

    def route_eval
      route = find_route
      response.status = 404 unless route

      if @inbox[response.status]
        response.write instance_eval(&@inbox[response.status])
        return response.finish
      end

      response.write instance_eval(&route[:handler]) if route
      response.finish
    end

    def find_route
      route = routes[request.request_method].detect do |r|
        r[:compiled_path] =~ request.path_info
      end

      if route
        $~.captures.each_with_index do |value, index|
          param = route[:extra_params][index]
          request.params[param] = value
        end
      end
      route
    end
  end

  Application = Base.new
end
