require_relative 'spec_helper'

describe Carnival do 
  let (:southwestplaza) {southwestplaza = Carnival.new("SouthWest Plaza", 30)}
 
  let (:carousel) {ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let (:ferris) {ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
  let (:coaster) {ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}
  
  let (:bruce) {visitor1 = Visitor.new('Bruce', 54, '$10')}
  let (:raven) {visitor2 = Visitor.new('Raven', 36, '$5')}
  let (:penny) {visitor3 = Visitor.new('Penny', 64, '$15')}

  describe "set-up" do
    it "exists and has attributes" do
      expect(southwestplaza).to be_a Carnival

      expect(southwestplaza.name).to eq("SouthWest Plaza")
      expect(southwestplaza.duration).to eq(30)
      expect(southwestplaza.rides).to eq([])
      # expect(southwestplaza.total_revenue).to eq(0)
    end
  end

  describe "method: add_rides" do
    it "can add rides" do
      southwestplaza.add_rides(carousel)
      southwestplaza.add_rides(coaster)
      southwestplaza.add_rides(ferris)
      
      expect(southwestplaza.rides).to eq([carousel, coaster, ferris])
    end
  end
  
  describe "method: most_popular_ride" do
    it "can tell which ride has the most rides" do
      southwestplaza.add_rides(carousel)
      southwestplaza.add_rides(coaster)
      southwestplaza.add_rides(ferris)

      penny.add_preference(:gentle)
      bruce.add_preference(:gentle)
      raven.add_preference(:gentle)
      penny.add_preference(:thrilling)
      bruce.add_preference(:thrilling)

      carousel.board_rider(penny)
      carousel.board_rider(bruce)
      carousel.board_rider(raven)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      ferris.board_rider(bruce)

      expect(southwestplaza.most_popular_ride).to eq(coaster)
    end
  end
  
  describe "method: most_profitable_ride" do
    it "can tell which ride makes the most money" do
      southwestplaza.add_rides(carousel)
      southwestplaza.add_rides(coaster)
      southwestplaza.add_rides(ferris)

      penny.add_preference(:gentle)
      bruce.add_preference(:gentle)
      raven.add_preference(:gentle)
      penny.add_preference(:thrilling)
      bruce.add_preference(:thrilling)

      carousel.board_rider(penny)
      carousel.board_rider(bruce)
      carousel.board_rider(raven)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      ferris.board_rider(bruce)
      ferris.board_rider(bruce)

      expect(southwestplaza.most_profitable_ride).to eq(ferris)
    end
  end

  describe "method: total_revenue" do
    it "can tell how much money is made" do
      southwestplaza.add_rides(carousel)
      southwestplaza.add_rides(coaster)
      southwestplaza.add_rides(ferris)

      penny.add_preference(:gentle)
      bruce.add_preference(:gentle)
      raven.add_preference(:gentle)
      penny.add_preference(:thrilling)
      bruce.add_preference(:thrilling)

      carousel.board_rider(penny)
      carousel.board_rider(bruce)
      carousel.board_rider(raven)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      coaster.board_rider(penny)
      ferris.board_rider(bruce)
      ferris.board_rider(bruce)

      expect(southwestplaza.total_revenue).to eq(21)
    end
  end
end

      







