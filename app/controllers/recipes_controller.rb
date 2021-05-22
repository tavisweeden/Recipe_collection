class RecipesController < ApplicationController

    get "/recipes" do

        if Helpers.is_logged_in?(session)
            erb :'recipes/recipes'
        else
            redirect "/login"
        end

    end


end