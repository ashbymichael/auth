# index
get '/users' do
  @users = User.all

  erb :'users/index'
end

# create
post '/users' do
  if params[:password] != params[:confirm_password]
    # TODO show the user an error message
    return erb :'users/new'
  end

  @user = User.new(username: params[:username])
  @user.password = params[:password]

  if @user.save
    login(@user)
    redirect "users/#{@user.id}"
  else
    # TODO Show the user a descriptive error message
    erb :'users/new'
  end
end

# new
get '/users/new' do
  erb :'users/new'
end

# show
get '/users/:id' do
  if params[:id].to_i == current_user.id
    @user = User.find(params[:id])
    @things = @user.things
    erb :'users/show'
  else
    redirect "users/#{current_user.id}"
  end
end
