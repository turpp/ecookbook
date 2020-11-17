class UsersController < ApplicationController

    get '/' do
        erb :'users/index'
    end

    post '/login' do
        
        @user=User.find_by(params[:user])
        if @user
            session[:user_id]=@user.id
            redirect '/user/account'
        else
            erb :error
        end
    end

    get '/user/account' do
        
        @user=User.find_by(id: session[:user_id])
        erb :'users/account'
    end



end