#new
# get '/sessions/new' do
get '/login' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    login(@user)
    redirect '/'
  else
    erb :'/sessions/new'
  end
end

# delete '/sessions' do
delete '/logout' do
  logout
  redirect '/'
end
