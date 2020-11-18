class RecipesController < ApplicationController
    
    get '/recipes' do
        @recipes=Recipe.all
        @recipeType=RecipeType.all
        
        erb :"recipes/index"
    end


    get '/recipes/new' do
        @recipeType=RecipeType.all
        erb :'recipes/new'
    end

    post '/recipes' do
        recipe=Recipe.create(params[:recipe])
        redirect :"recipes/#{recipe.id}"
        
    end

    get '/recipes/:id/edit' do
        @recipe=Recipe.find_by(id: params[:id])
        @recipeType=RecipeType.all
        erb :'recipes/edit'
    end

    patch '/recipes/:id' do
        recipe=Recipe.find_by(id: params[:id])
        recipe.update(params[:recipe])
        redirect "recipes/#{recipe.id}"
    end

    delete '/recipes/:id' do
        
        recipe=Recipe.find_by(id: params[:id])
        recipe.destroy
        redirect '/recipes'
    end

    get '/recipes/:id' do
        @recipe=Recipe.find_by(id: params[:id])
        @ingredients=bullet_list(@recipe.ingredients).reject{|i| i==""}
        erb :"recipes/show"
    end 




end