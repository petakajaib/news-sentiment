class ApplicationController < ActionController::Base
  puts "HTTP_USERNAME: #{ENV["HTTP_USERNAME"]}"
  http_basic_authenticate_with name: ENV["HTTP_USERNAME"], password: ENV["HTTP_PASSWORD"], except: [:index, :show]
end
