class UsersController < ApplicationController

    get "/signup" do 
        erb :'users/create_user'
    end

    post "/signup" do
        user=User.new(name: params[:name], email: params[:email], password: params[:password])

        if  @user.save && !@user.username.empty? && !@user.email.empty? 
            
            session[:user_id] = @user.id

            redirect "/recipes"
        else
            redirect "/signup"
        end

     end

     get "/login" do
        erb :'/login'
     end

     post "/login" do
        @user = User.find_by(:name => params[:name])

        if @user && @user.authenticate(params[:password])

            session[:user_id] = @user.id
        
            redirect "/recipes"

        else

            erb :"users/failure"

        end


     end

     get "/logout" do

        session.clear

        redirect "/login"
        
        
    end
    
end