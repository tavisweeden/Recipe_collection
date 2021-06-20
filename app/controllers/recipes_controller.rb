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
        
        if !params.empty?
            @user = User.find_by(id: session[:user_id])
            @recipe = Recipe.create(params[:recipe])
            @recipe.name = params["name"]
            @recipe.content = params["content"]
            @recipe.user = @user
            @recipe.save
  
            redirect "recipes/#{@recipe.id}"
        else
            redirect "/recipes/new"
        end
    end

    get "/recipes/:id" do
        
        if Helpers.is_logged_in?(session)
            @recipe = Recipe.find(params[:id])
            erb :'/recipes/show'
        else
            redirect "/login"
        end
    end

    get "/recipes/:id/edit" do
        if Helpers.is_logged_in?(session)

            @recipe = Recipe.find(params[:id])
   
            erb :'/recipes/edit'
        else
            redirect "/login"
        end
    end

    patch "/recipes/:id" do
        

        @recipe = Recipe.find_by(params[:id])

        if !params.empty?
            @recipe.update(params["recipe"])

            redirect "/recipes/#{@recipe.id}"

        else
            redirect "/recipes/#{@recipe.id}/edit"
        end

    end
    
end