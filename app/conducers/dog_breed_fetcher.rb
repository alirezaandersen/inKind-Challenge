class DogBreedFetcher
  attr_reader :breed

  def initialize(name="random")
    @name  = name
  end

  def fetch
    @breed = dog_breeds
  end

  def self.fetch(name="random")
    DogBreedFetcher.new(name).fetch
  end

  private

  def dog_breeds
    canine = []
    fetch_names["message"].each do |breed, sub_breed|
      if sub_breed.empty?
        canine << breed
      else
        sub_breed.reverse.each do |x|
          canine << "#{breed}"+"-"+"#{x}"
        end
      end
    end
    canine
  end

  def self.fetch_picture(canine)
    RestClient.get("https://dog.ceo/api/breed/#{canine.downcase}/images/random")
  end

  def fetch_names
    JSON.parse(RestClient.get("https://dog.ceo/api/breeds/list/all").body)
  end

end
