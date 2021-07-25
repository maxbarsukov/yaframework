# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  response.redirect "/hello"
end

app.get "/hello" do
  "Hi, you were redirected here from the root page. You can go <a href=\"/error\"></a> to get a 401 error"
end

app.get "/error" do
  response.status = 401
  halt response.finish
end

app.listen(4567)
