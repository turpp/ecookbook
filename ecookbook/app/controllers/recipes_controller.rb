class RecipesController < ApplicationController
    
    get '/recipes' do
        @recipes=Recipe.all
        erb :"recipes/index"
    end

    get '/recipes/:id' do
        @recipe=Recipe.find_by(id: params[:id])
        erb :"recipes/show"
    end 



end