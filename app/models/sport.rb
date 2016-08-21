class Sport

  attr_accessor :name, :players, :country_of_origin

  def initialize(hash)
    @name = hash['name']
    @players = hash['players']
    @country_of_origin = hash['country_of_origin']
  end
  
end