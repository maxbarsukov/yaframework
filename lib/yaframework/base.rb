require "rack"

module Yaframework
  class Base
    attr_reader :routes
    attr_reader :request

    def initialize
      @routes = {}
    end

    def route(verb, path, &handler)
      verb = verb.to_s.upcase
      path = "/#{path}" unless path[0] == '/'

      @routes[verb] ||= {}
      @routes[verb][path] = handler
    end


    def call(env)
      @request = Rack::Request.new(env)
      verb  = @request.request_method
      path  = @request.path_info

      handler = @routes.fetch(verb, {}).fetch(path, nil)

      if handler
        result = instance_eval(&handler)
        return result.instance_of? String ? [200, {}, [result]] : result
      end
      [404, {}, ["Route for #{verb} #{path} not found"]]
    end

    def params
      @request.params
    end
  end
end
