class Carnival
  attr_reader :name,
              :duration,
              :rides 

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_rides(ride)
    @rides << ride
  end

  def most_popular_ride
    max_ride_count = 0
    max_ride = nil
    @rides.each do |ride| 
      if ride.rider_log.values.sum > max_ride_count
        max_ride_count = ride.rider_log.values.sum
        max_ride = ride
      end
    end
    max_ride
  end

  def most_profitable_ride
    max_revenue = 0
    max_ride = nil
    @rides.each do |ride| 
      if ride.total_revenue > max_revenue
        max_revenue = ride.total_revenue
        max_ride = ride
      end
    end
    max_ride
  end

  def total_revenue
    @rides.inject(0) { |sum, ride| sum + ride.total_revenue}
  end



end
