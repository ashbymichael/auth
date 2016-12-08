#new
# get '/sessions/new' do
get '/login' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'/sessions/new'
  end
end
