require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    # set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Session::Cookie,  :key => 'rack.session',
                                :path => '/',
                                # prevents tampering with session hash
                                :secret => 'your_secret'
                                
    use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect '/chores'
    else
      erb :index
    end
  end

  helpers do

    def current_user
      # @current_user = @current_user if already exists, otherwise @current_user = Roommate.find(session[:roommate_id]) if session[:roommate_id].present?
      @current_user ||= Roommate.find(session[:roommate_id]) if session[:roommate_id]
    end

    def logged_in?
      # calls current_user. if @current_user nil, returns false. if @current_user is not nil, returns true
      !!current_user
    end

	end

end
