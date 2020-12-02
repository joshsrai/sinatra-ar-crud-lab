
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #* Get Articles List WORK ON THISSSSSSSSLMFOEWJFOMWLDS>>>
  get '/' do
    erb :welcome
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # get '/genres' do
  #   @genres = Genre.all
  #   erb :'genres/index'
  # end

  #* Get new articles form
  get '/articles/new' do
    erb :new
  end

#* Create new articles from form
post '/articles' do
  @article = Article.create(params)
  redirect "/articles/#{@article.id}"
end

#* Get articles show page
  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end



#* Get edit article form
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

#* Update Genre
  patch '/articles/:id' do
    article = Article.find(params[:id])
    new_params ={}
    new_params[:title] = params[:title]
    new_params[:content] = [params[:content]]
    article.update(new_params)

    redirect to "/articles/#{article.id}"
  end

# patch '/genres/:id' do
#   genre = Genre.find(params[:id])
#   genre.update(params[:genre])
#   redirect to "/genres/#{genre.id}"
# end

#* delete genre
  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.destroy
    redirect to "/articles"
  end

  #   delete '/genres/:id' do
  #     genre = Genre.find(params[:id])
  #     genre.destroy

  #     redirect to '/genres'
  # end

end
