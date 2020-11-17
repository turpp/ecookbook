class UsersController < ApplicationController

    get '/' do
        erb :'users/index'
    end

    post '/login' do
        binding.pry
        @user=User.find_by(params[:user])
        if @user
            session[:user_id]=@user.id
            redirect '/user/account'
        else
            erb :error
        end
    end

    get '/user/account' do
        binding.pry
        erb :'users/account'
    end



end