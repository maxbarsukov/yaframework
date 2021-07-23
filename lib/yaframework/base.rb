# frozen_string_literal: true

require "rack"

module Yaframework
  class Base
    attr_reader :routes, :request, :response, :env

    def initialize
      @routes = {}
    end

    %w[GET POST PATCH PUT DELETE HEAD OPTIONS].each do |verb|
      define_method :"#{verb.downcase}" do |path, &handler|
        route(verb, path, &handler)
      end
    end

    def call(env)
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
      @params = request.params
      @env = env

      verb  = @request.request_method
      path  = @request.path_info

      handler = @routes.fetch(verb, {}).fetch(path, nil)

      if handler
        result = instance_eval(&handler)
        return result.instance_of?(String) ? [200, {}, [result]] : result
      end
      [404, {}, ["Route for #{verb} #{path} not found"]]
    end

    def params
      @request.params
    end

    def listen(port = 5000)
      Rack::Handler::WEBrick.run self, Port: port
    end

    private

    def route(verb, path, &handler)
      path = "/#{path}" unless path[0] == "/"

      @routes[verb] ||= {}
      @routes[verb][path] = handler
    end
  end

  Application = Base.new
end
