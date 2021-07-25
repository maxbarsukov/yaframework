# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  response.redirect "/html"
end

app.get "/html" do
  response.html "This is <b>HTML</b>, where you cat use some <small>tags</small>.
  <br/>JSON <a href=\"/json\">here</a>,
  <br/>Plain text <a href=\"/text\">here</a>"
end

app.get "/text" do
  response.text "Just plain text.<br/>Boring, even tags don't work..."
end

app.get "/json" do
  response.json "{ \"The awesomeness of this framework\": \"100/100\" }"
end

app.listen(4567)
