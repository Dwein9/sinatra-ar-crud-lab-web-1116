require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  post '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    @post.update(name: params[:name], content: params[:content])

    redirects '/posts/#{@post.id}'
  end

  post '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    @post.delete
    erb :deleted
  end




end

# The get '/models/:id' controller action handles requests for a given instance of your model.
# For example, if a user types in www.yourwebsite.com/models/2, this route will catch that request and get the id number,
# in this case 2, from the params. It will then find the instance of the model with that id number and set it equal to
# an instance variable: @model = Model.find(params[:id]). Finally, it will render the show.erb view page.
# The show.erb view page will use erb to render the @model object.
