# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

# Just go to the root page and say hello
app.get "/" do
  "Hello world!"
end

app.listen(4567)
