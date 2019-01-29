class ArtworksController < ApplicationController
 def index
    artwork = Artwork.all.select { |art| art.artist_id == params[:user_id].to_i }

    render json: artwork 
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])

    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 404
    end
  end 

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 400
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])

    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 404
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end

