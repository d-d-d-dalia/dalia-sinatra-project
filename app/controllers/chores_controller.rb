require 'pry'

class ChoresController < ApplicationController

get '/chores' do
  if !logged_in?
    redirect '/login'
  else
    # we will want to grab the current_user to grab it's household which contains all of the roomates
    @roommates = current_user.household.roommates
    erb :'chores/chores'
  end
end

get '/chores/new' do
  if logged_in?
    erb :'chores/create_chore'
  else
    redirect to '/login'
  end
end

post '/chores' do
  redirect '/login' unless logged_in?
    if !params[:name].empty?
      @chore = current_user.chores.create(:name => params[:name])
      redirect "/chores/#{@chore.id}"
    else
      redirect '/chores/new'
  end
end

get '/chores/:id' do
  if logged_in?
    @chore = Chore.find_by(:id => params[:id])
    erb :'chores/show'
  else
    redirect '/login'
  end
end

get '/chores/:id/edit' do
  if logged_in?
    @chore = Chore.find_by_id(params[:id])
      if @chore.roommate_id == current_user.id
        erb :'chores/edit_chore'
      else
        redirect to '/chores'
      end
  else
    redirect to '/login'
  end
end

patch '/chores/:id' do
  @chore = Chore.find_by_id(params[:id])
  if params[:name] != ""
    @chore.name = params[:name]
    @chore.save
  end
  redirect "chores/#{@chore.id}/edit"
end

delete '/chores/:id/delete' do
  if logged_in?
    @chore = Chore.find_by_id(params[:id])
      if @chore.roommate_id == current_user.id
        @chore.delete
        redirect to '/chores'
      else
  redirect to '/chores'
      end
  else
    redirect to '/login'
  end
end

end
