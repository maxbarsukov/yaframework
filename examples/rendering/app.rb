# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.before do
  @number = Random.rand
  puts @number
end

app.get "/" do
  render "index"
end

app.listen(4567)
