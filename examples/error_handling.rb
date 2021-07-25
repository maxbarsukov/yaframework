# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  "This is the root, go somewhere else..<br/>Maybe <a href=\"/asdfg\">here</a>, idk"
end

app.handle 404 do
  "Hey, I just handled a 404 error!<br/>The dude from the previous page deceived you!"
end

app.handle 500 do
  "Error 500, this shouldn't have happened..."
end

app.listen(4567)
