module DogWalkingService
  def self.list(filter)
    if filter.to_i == 1
      DogWalking.where('scheduled_date >= ?', Date.today)
    else
      DogWalking.all
    end
  end

  def self.price_calculate(duration, pets = [])
    price = Price.where(duration: duration).last
    calculate = 0
    if price && pets.count >= 1
      calculate += price.unitary_price
      calculate += (pets.count - 1) * price.aditional_price
    end
    calculate
  end

  def self.create_walking(params)
    params['pets'] = Pet.where(id: params[:pets])
    w = DogWalking.new(params)
    w.price = DogWalkingService.price_calculate(w.duration, params[:pets] )
    w
  end

end