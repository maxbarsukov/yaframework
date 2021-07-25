# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/" do
  request[:username] = "IVAN!"
  "Now 'request[:username]': #{request[:username]} contains in 'request.params': #{request.params}"
end

app.listen(4567)
