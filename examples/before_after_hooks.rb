# frozen_string_literal: true

require "yaframework"
app = Yaframework::Application

app.before do
  @page_updates ||= 0
  @page_updates += 1
end

app.after do
  puts "Some log info: #{response.body}"
  response.write "<br>Refresh the page and your next number will be #{@page_updates + 1}!"
end

app.get "/" do
  "Hello, your num is: #{@page_updates}"
end

app.listen(4567)
