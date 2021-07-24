# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.get "/:name" do
  "Hello #{request.params[:name]}!"
end

app.get "/:name/foo/:bar" do
  "Hello #{request.params[:name]} from #{request.params[:bar]}!"
end

app.listen(4567)
