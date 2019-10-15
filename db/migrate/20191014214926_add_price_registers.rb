class AddPriceRegisters < ActiveRecord::Migration[5.2]
  def change
    Price.create(duration: 30, unitary_price: 25.0, aditional_price: 15.0)
    Price.create(duration: 60, unitary_price: 35.0, aditional_price: 20.0)
  end
end
