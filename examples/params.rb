# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

# Any route, like /max or /ivan
app.get "/:name" do
  "Hello #{request.params[:name]}!"
end

# You can try /max/from/rnd and see it with your own eyes
app.get "/:name/from/:bar" do
  "Hello #{request.params[:name]} from #{request.params[:bar]}!"
end

app.listen(4567)
