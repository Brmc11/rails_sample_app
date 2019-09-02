class ApplicationController < ActionController::Base
  def hello
    render html: "this is just a string!"
  end
end
