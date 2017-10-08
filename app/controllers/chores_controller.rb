class ChoresController < ApplicationController


get '/chores' do
  if !logged_in?
    redirect '/login'
  else
    @chores = Chore.all
    erb :'chores/show'
  end
end

end
