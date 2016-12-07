# index
get '/users' do
  @users = User.all

  erb :'users/index'
end

# create
post '/users' do
  @user = User.new(username: params[:username])

  if @user.save
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
  @user = User.find(params[:id])
  @things = @user.things
  erb :'users/show'
end
