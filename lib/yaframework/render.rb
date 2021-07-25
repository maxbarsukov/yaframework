# frozen_string_literal: true

require "tilt"

module Yaframework
  module Render
    def setup(settings = {})
      @settings = settings
      @settings[:template_engine] ||= "erb"
      @settings[:layout]  ||= "layout"
      @settings[:views]   ||= File.expand_path("views", File.dirname($PROGRAM_NAME))
      @settings[:options] ||= {
        default_encoding: Encoding.default_external
      }
    end

    def render(template, locals = {}, layout = @settings[:layout])
      res.headers["Content-Type"] ||= "text/html; charset=utf-8"
      res.write(view(template, locals, layout))
    end

    def view(template, locals = {}, layout = @settings[:layout])
      partial(layout, locals.merge(content: partial(template, locals)))
    end

    def partial(template, locals = {})
      _render(template_path(template), locals, @settings[:options])
    end

    def template_path(template)
      dir = @settings[:views]
      ext = @settings[:template_engine]
      File.join(dir, "#{template}.#{ext}")
    end

    private

    def _render(template, locals = {}, options = {}, &block)
      _cache.fetch(template) {
        Tilt.new(template, 1, options.merge(outvar: "@_output"))
      }.render(self, locals, &block)
    end

    def _cache
      Thread.current[:_cache] ||= Tilt::Cache.new
    end
  end
end
