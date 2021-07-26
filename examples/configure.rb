# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.configure do
  @app_name = "Your awesome app"
end

app.get "/" do
  "Hey, that's #{@app_name}"
end

app.listen(9292)
