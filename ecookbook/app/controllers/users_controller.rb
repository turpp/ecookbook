require 'sinatra/flash'

class UsersController < ApplicationController
    register Sinatra::Flash
    get '/login' do
        if session[:user_id]
            flash[:message] = "You are already logged in!"
            redirect to ('/user/account')
        else
        erb :'users/index'
        end
    end

    post '/login' do
        if something_there(params[:user][:username])&&something_there(params[:user][:password_digest])
            user=User.find_by(username: params[:user][:username])
            if user
                if user.password_digest==params[:user][:password_digest]
                    session[:user_id]=user.id
                    redirect '/user/account'
                else
                    flash[:message]="Username and Password match invalid."
                    redirect to('/login')
                end
            else
                flash[:message]="Invalid username."
             redirect to('/login')
            end
        else
            flash[:message]="Please enter something in every field"
            redirect to('/login')
        end
    end

    get '/signup' do
        if is_logged_in
            flash[:message] = "You are already logged in!"
            redirect to('/user/account')
        else
            erb :'users/signup'
        end
    end

    post '/user/signup' do
        if something_there(params[:user][:username])&&something_there(params[:user][:password_digest])

        
            if User.find_by(username: params[:user][:username])
                flash[:message] = "Username already taken. Try a different username."
                redirect to('/signup')
            else
                if params[:user][:password_digest]==params[:retyped_password]
                    user=User.create(params[:user])
                    session[:user_id]=user.id
                    redirect '/user/account'
                else
                    flash[:message]="Password did not match. Try again"
                    redirect to('/signup')
                end
            end
        else
            flash[:message]="Please fill out all fields."
            redirect to('/signup')
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