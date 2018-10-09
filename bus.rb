# Create a Bus class.
# The Bus should have a route number (e.g. 22) and a destination (e.g. "Ocean Terminal").
# The Bus should have a drive method that returns a string (e.g. "Brum brum").

# Create a Person class.
# The Person class should have attributes of a name and age.

# Give the Bus class a new property, 'passengers'. This should be an array, which starts off empty.
# Add a method to the Bus class which returns how many passengers are on the bus.
# Add a method to the Bus class which takes in a Person and adds it to the array of passengers. The method could look something like bus.pick_up(passenger1)
# Add a method that drops off a passenger and removes them from the array. This could look like bus.drop_off(passenger2)
# Add an 'empty' method to remove all of the passengers - this might be used when the bus reaches its destination, or if the bus breaks down. It should remove all of the passengers from the array.

class Bus

  attr_reader :route, :destination

  def initialize(route, destination)
    @route = route
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum"
  end

  def count_passengers
    return @passengers.length
  end

  def pick_up(person)
    @passengers << person
  end

  def drop_off(person)
    @passengers.delete(person)
  end

  def empty
    @passengers = []
  end

end
