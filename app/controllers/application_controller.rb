require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Session::Cookie,  :key => 'rack.session',
                                :path => '/',
                                :secret => 'your_secret'
    use Rack::Flash
  end

  get "/" do
    erb :index
  end

  helpers do

    def current_user
      @current_user ||= Roommate.find(session[:roommate_id]) if session[:roommate_id].present?
    end

    def logged_in?
      !!current_user
    end

	end
end
