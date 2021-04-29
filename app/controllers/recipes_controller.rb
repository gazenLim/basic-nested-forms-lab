class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times {@recipe.ingredients.build}
    

  end

  def create
@recipe = Recipe.new(params_recipe)
@recipe.save
redirect_to recipe_path(@recipe)
  end



  private

  def params_recipe
binding.pry
 params.require(:recipe).permit(:title,
  ingredients_attributes: [:name, :quantity])
end

end