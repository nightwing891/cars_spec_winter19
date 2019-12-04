class Car < ApplicationRecord
  def self.by_model
    # return all Cars sorted by model in ascending order
    # Car.order(:model)
    order(:model)
  end
  
  def self.by_make
     # return all Cars sorted by make in ascending order
    #  order(make: :desc)
     order(:make)
  end
  
  def self.by_price(direction = :asc)
    # return all cars sorted by price in ascending order if no param is passed in
    # return all cars sorted by price in descending order if :desc is passed in
    # order(price: :asc)
    # order(price: :desc)
    order(price: direction)
  end
  
  def paint(color)
    # change the color of an instance of a car
    self.update(color: color)
  end
  
  def info
    # return all data from a car as a hash except for id created_at and updated_at
    self.attributes.except('id', 'created_at', 'updated_at')
  end
  
  def honk
     # return a string that is the car's horn sound
     'Beep!'
  end
end
