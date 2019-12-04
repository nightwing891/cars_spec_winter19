require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    # it 'has a make' do
    #   make = 'Toyota'
    #   car = Car.create(make: make)
    #   expect(car.make).to eq(make)
    # end

    # it 'has a price' do
    #   price = 1.2
    #   car = Car.create(price: price)
    #   expect(car.price).to eq(price)
    # end
    it { should respond_to :make }
    it { should respond_to :price }
    it { should respond_to :mileage }
    it { should respond_to :color }
    it { should respond_to :model }
    it { should respond_to :year }

  end

  describe 'class methods' do
    before(:each) do
      @car1 = Car.create(make: 'Subaru', model: 'Legacy', price: 8000.00 )
      @car2 = Car.create(make: 'Volkswagon', model: 'Fox', price: 4000.00  )
      @car3 = Car.create(make: 'Nissan', model: 'Altima', price: 23000.00 )
    end

    it 'sort by model asc' do
      # @car1 = Car.create(make: 'Subaru', model: 'Legacy', price: 8000.00 )
      # @car2 = Car.create(make: 'Volkswagon', model: 'Fox', price: 4000.00  )
      # @car3 = Car.create(make: 'Nissan', model: 'Altima', price: 23000.00 )
      expect(Car.by_model).to eq([@car3, @car2, @car1])
    end

    it 'sort by make asc' do
      expect(Car.by_make).to eq([@car3, @car1, @car2])
    end

    it 'sort by price asc' do
      expect(Car.by_price).to eq([@car2, @car1, @car3])
    end

    it 'sort by price desc' do
      expect(Car.by_price(:desc)).to eq([@car3, @car1, @car2])
    end
  end

  describe 'instance methods' do
    before(:each) do
      @attr = {
        make: 'Ferrari',
        model: 'McCalarin',
        color: 'Red',
        mileage: 1,
        price: 500000.00,
        year: 2019
      }
      @car = Car.create(@attr)
    end

    it 'paints the car' do
      @car.paint('Black')
      expect(@car.color).to eq('Black')
    end

    it 'provide info in a hash' do
      # :color => 'red', 
      expect(@car.info).to eq(@attr.with_indifferent_access)
    end

    it 'honks the horn' do
      expect(@car.honk).to eq('Beep!')
    end
  end


end
