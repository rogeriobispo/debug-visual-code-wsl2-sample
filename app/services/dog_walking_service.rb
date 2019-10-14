module DogWalkingService
  def self.list(filter)
    if filter.to_i == 1
      DogWalking.where('scheduled_date >= ?', Date.today)
    else
      DogWalking.all
    end
  end
end