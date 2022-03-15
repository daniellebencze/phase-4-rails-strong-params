class BirdsController < ApplicationController

    wrap_parameters format: []

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  # def create
  #   bird = Bird.create(name: params[:name], species: params[:species])
  #   render json: bird, status: :created
  # end

#   def create
#   bird = Bird.create(params)
#   render json: bird, status: :created
# end
#method above will not work since a malicious user can potentially update attributes we dont want to give them access to 


  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # other controller actions here

  private
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

end
