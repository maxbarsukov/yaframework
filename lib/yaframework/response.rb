# frozen_string_literal: true

module Yaframework
  class Response
    LOCATION = "Location"

    module ContentType
      HTML = "text/html"
      TEXT = "text/plain"
      JSON = "application/json"
    end

    attr_accessor :status
    attr_reader :headers, :body

    def initialize(body = [], status = 200, headers = { "Content-Type" => "text/html; charset=utf-8" })
      @body = []
      @headers = headers
      @status = status
      @length = 0

      if body.respond_to? :to_str
        write body.to_str
      elsif body.respond_to? :each
        body.each { |i| write i.to_s }
      else
        raise TypeError, "Body must #respond_to? #to_str or #each"
      end
    end

    def finish
      @headers[Rack::CONTENT_LENGTH] = @length.to_s unless (100..199).include?(status) || status == 204
      [status, headers, body]
    end

    def redirect(target, status = 302)
      @status = status
      @headers[LOCATION] = target
    end

    def write(string)
      s = string.to_s
      @length += s.bytesize
      @body << s
      nil
    end

    def [](key)
      @headers[key]
    end

    def []=(key, value)
      @headers[key] = value
    end

    def html(str)
      @headers[Rack::CONTENT_TYPE] = ContentType::HTML
      write(str)
    end

    def text(str)
      @headers[Rack::CONTENT_TYPE] = ContentType::TEXT
      write(str)
    end

    def json(str)
      @headers[Rack::CONTENT_TYPE] = ContentType::JSON
      write(str)
    end

    def set_cookie(key, value)
      Rack::Utils.set_cookie_header!(@headers, key, value)
    end

    def delete_cookie(key, value = {})
      Rack::Utils.delete_cookie_header!(@headers, key, value)
    end
  end
end
