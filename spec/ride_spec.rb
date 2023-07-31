require_relative 'spec_helper'

describe Ride do
  let (:visitor1) {visitor1 = Visitor.new('Bruce', 54, '$10')}
  let (:visitor2) {visitor2 = Visitor.new('Tucker', 36, '$5')}
  let (:visitor3) {visitor3 = Visitor.new('Penny', 64, '$15')}

  let (:ride1) {ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let (:ride2) {ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
  let (:ride3) {ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}

  describe "set-up" do
    it "exists and has attribures" do
      expect(ride1).to be_a Ride

      expect(ride1.name).to eq("Carousel")
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
      expect(ride1.rider_log).to eq({})
      
    end
  end

  describe "method: board_rider" do
    it "logs riders, reduces rider's spending money, and totals revenue" do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})

      expect(visitor1.spending_money).to eq(8)
      expect(visitor2.spending_money).to eq(4)

      expect(ride1.total_revenue).to eq(3)
    end

    it "will not board riders that are not tall enough" do


