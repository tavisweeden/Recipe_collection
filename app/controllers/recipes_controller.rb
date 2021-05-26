class RecipesController < ApplicationController

    get "/recipes" do

        if Helpers.is_logged_in?(session)
            erb :'recipes/recipes'
        else
            redirect "/login"
        end

    end

    get "/recipes/new" do

        if Helpers.is_logged_in?(session)
            erb :'recipes/new'
        else
            redirect "/login"
        end
    end

    post "/recipes" do
        if !params["name"]["content"]["amount"].empty?
            @user = User.find_by(id: session[:user_id])
            @recipe = Recipe.new(name: params[:name],content: params[:content],amount: params[:amount] )
            @recipe.user = @user
            @recipe.save
            
            redirect "recipes/#{@recipe.id}"
        else
            redirect "/recipes/new"
        end
    end
    
end