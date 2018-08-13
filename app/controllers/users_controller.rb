class UsersController < ApplicationController

# signup
  get '/signup' do
    if logged_in?
      redirect '/show'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])
    redirect '/login'
  end

# login
  get '/login' do
    if logged_in?
      redirect '/show'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(name: params[:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/show'
    else
      redirect 'login'
    end
  end

#account page
  get '/show' do
    if logged_in?
      @user = current_user
      @statuses = ["accepted","cleaning", "drying", "waiting", "done"]
      erb :'users/show'
    else
      redirect '/login'
    end
  end

  get '/edit' do
    if logged_in?
      @user = current_user
      erb :'/users/edit'
    else
      redirect '/login'
    end
  end

  patch '/show' do
    @user = current_user
    @user.update(params[:user])
    @user.save
    erb :'users/show'
  end



#logout
  get '/logout' do
    session.clear
    redirect '/'
  end

end
