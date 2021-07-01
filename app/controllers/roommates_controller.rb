class RoommatesController < ApplicationController

  get '/signup' do
    if session[:roommate_id]
      redirect to '/chores'
    else
      erb :'roommates/create_roommate'
    end
  end

  post '/signup' do
    if params[:name] == "" || params[:password] == "" || params[:email] == "" || (params[:household][:id] == "" && params[:household][:name] == "")
      redirect to '/signup'
    else
      @roommate = Roommate.new(:name => params[:name], :password => params[:password], :email => params[:email])
      if params[:household][:name] != ""
        @household = Household.create(:name => params[:household][:name])
      else
        @household = Household.find(params[:household][:id])
      end
      @roommate.household = @household
      if @roommate.save
        session[:roommate_id] = @roommate.id
        redirect to '/chores'
      end
    end
  end

  get '/login' do
    if session[:roommate_id]
      redirect to '/chores'
    else
      erb :'roommates/login'
    end
  end

  post '/login' do
    user = Roommate.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:roommate_id] = user.id
      redirect to '/chores'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/login'
    end
  end

end
