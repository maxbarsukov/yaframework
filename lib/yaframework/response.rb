# frozen_string_literal: true

module Yaframework
  class Response
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
      headers["Content-Length"] = @length.to_s unless (100..199).include?(status) || status == 204
      [status, headers, body]
    end

    def redirect(target, status = 302)
      self.status = status
      headers["Location"] = target
    end

    def write(string)
      s = string.to_s
      @length += s.bytesize
      body << s
    end
  end
end
