# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  response.set_cookie("foo", "bar")
  "Your cookies, sir: #{response["Set-Cookie"]}.<br/>Go <a href=\"/delete\">here</a> to delete them"
end

app.get "/delete" do
  response.delete_cookie("foo")
  "Your cookies, sir: #{response["Set-Cookie"]}"
end

app.listen(4567)
