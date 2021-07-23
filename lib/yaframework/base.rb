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

    def params
      @request.params
    end
  end
end
