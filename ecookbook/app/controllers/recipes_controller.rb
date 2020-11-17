class RecipesController < ApplicationController
    
    get '/recipes' do
        @recipes=Recipe.all
        
        erb :"recipes/index"
    end


    get '/recipes/new' do
        erb :'recipes/new'
    end

    post '/recipes' do
        recipe=Recipe.create(params[:recipe])
        redirect :"recipes/#{recipe.id}"
        
    end

    get '/recipes/:id/edit' do
        @recipe=Recipe.find_by(id: params[:id])
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
        erb :"recipes/show"
    end 




end