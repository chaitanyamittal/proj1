class PokemonsController < ApplicationController

  def create
  	@pokemon = Pokemon.new
  	@pokemon.name = params[:name]
  	@pokemon.trainer_id = current_trainer.id
  	@pokemon.health = 100
  	@pokemon.level = 1
  	redirect_to new_pokemon_path
  end

  def new
  	@pokemon = Pokemon.new
  end

  def capture
    @pokemon = Pokemon.find(params[:id])
  	@pokemon.trainer_id = current_trainer.id
  	@pokemon.save
  	redirect_to root_path
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.health -= 10
  	@pokemon.save
  	if @pokemon.health <= 0
  		@pokemon.destroy
  	end
  	redirect_to trainers_path
  end

end