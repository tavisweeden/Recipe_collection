class UsersController < ApplicationController

    get "/signup" do 
        erb :"users/create_user"
    end

    post "/signup" do
        user=User.new(name: params[:name], email: params[:email], password: params[:password])

        if  @user.save && !@user.username.empty? && !@user.email.empty? 
            
            session[:user_id] = @user.id

            redirect "/"
        else
            redirect "/signup"
        end

     end

     


end