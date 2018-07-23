class BreedsController < ApplicationController
  def index
    @breed = DogBreedFetcher.fetch
  end

  def show_image
    dog_pic = DogBreedFetcher.fetch_picture(params[:type])
    render :json => dog_pic
  end

end
