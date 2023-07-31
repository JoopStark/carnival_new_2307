class Ride 
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement, 
              :total_revenue, 
              :rider_log

  def initialize(ride_data)
    @ride_data = ride_data
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    if visitor.tall_enough?(@min_height) && visitor.preferences.include?(@excitement) 
      visitor.pay_admission(@admission_fee)
      @total_revenue += @admission_fee
      @rider_log[visitor] += 1
    end
  end
end