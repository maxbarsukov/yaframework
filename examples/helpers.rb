# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.helpers do
  def hello
    "Hello"
  end

  def colon
    ", "
  end
end

app.helpers do
  def world
    "world!"
  end
end

app.get "/" do
  hello + colon + world
end

app.listen(9292)
