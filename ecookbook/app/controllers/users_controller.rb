class UsersController < ApplicationController

    get '/login' do
        if session[:user_id]
            redirect 'user/account'
            #flash message
        else
        erb :'users/index'
        end
    end

    post '/login' do
        
        @user=User.find_by(params[:user])
        if @user
            session[:user_id]=@user.id
            redirect '/user/account'
        else
            erb :'users/error'
        end
    end

    get '/signup' do
        if is_logged_in
            "Your already logged in"
        else
            erb :'users/signup'
        end
    end

    post '/user/signup' do
        
        if params[:user][:password_digest]==params[:retyped_password]
            user=User.create(params[:user])
            session[:user_id]=user.id
            redirect '/user/account'
        else
            redirect '/signup'
            #put in a flash message
        end
        
    end

    get '/logout' do
        session.clear
        redirect '/login'
        
    end

    get '/user/account' do
        @recipes=Recipe.all
        @recipeType=RecipeType.all

        @user=User.find_by(id: session[:user_id])
        erb :'users/account'
    end

    


end