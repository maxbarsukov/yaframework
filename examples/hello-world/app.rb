# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  "Hello world!"
end

app.listen(4567)
