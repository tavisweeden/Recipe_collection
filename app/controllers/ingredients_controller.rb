class IngredientsController < ApplicationController

    get "/ingredients" do
        if Helpers.is_logged_in?(session)
            @ingredients = Ingredient.all
            erb :'ingredients/ingredients'
        else
            redirect "/login"
        end
    end
end