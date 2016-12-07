# index
get '/things' do
  @things = Thing.all

  erb :'things/index'
end

# create
post '/things' do
  @thing = Thing.new(params)

  if @thing.save
    redirect "things/#{@thing.id}"
  else
    erb :'things/new'
  end
end

# new
get '/things/new' do
  erb :'things/new'
end

# show
get '/things/:id' do
  @thing = Thing.find(params[:id])

  erb :'things/show'
end

# destroy
delete '/things/:id' do
  @thing = Thing.find(params[:id])
  @thing.destroy
  redirect '/things'
end
