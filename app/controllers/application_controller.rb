class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    Recipe.create(params)
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  @recipe.name = params[@recipe.name]
  @recipe.content = params[@recipe.ingredients]
  @recipe.cook_time = params[@recipe.cook_time]
  @recipe.save
  erb :show
end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
  end

end
