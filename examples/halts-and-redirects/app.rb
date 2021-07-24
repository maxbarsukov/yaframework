# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  response.redirect "/hello"
end

app.get "/hello" do
  "Hello world!"
end

app.get "/error" do
  response.status = 401
  halt response.finish
end

app.listen(4567)
