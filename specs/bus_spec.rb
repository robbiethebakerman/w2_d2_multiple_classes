require("minitest/autorun")
require("minitest/rg")
require_relative("../bus")
require_relative("../person")

class BusTest < MiniTest::Test

  def setup
    @bus_22 = Bus.new(22, "Ocean Terminal")
    @person1 = Person.new("Jim", 70)
    @person2 = Person.new("Sarah", 45)
  end

  def test_get_bus_route
    assert_equal(22, @bus_22.route)
  end

  def test_get_bus_destination
    assert_equal("Ocean Terminal", @bus_22.destination)
  end

  def test_drive
    assert_equal("Brum brum", @bus_22.drive)
  end

  def test_count_passengers
    assert_equal(0, @bus_22.count_passengers)
  end

  def test_pick_up
    @bus_22.pick_up(@person1)
    no_of_passengers = @bus_22.count_passengers
    assert_equal(1, no_of_passengers)
  end

  def test_drop_off
    @bus_22.pick_up(@person1)
    @bus_22.drop_off(@person1)
    no_of_passengers = @bus_22.count_passengers
    assert_equal(0, no_of_passengers)
  end

  def test_empty
    @bus_22.pick_up(@person1)
    @bus_22.pick_up(@person2)
    @bus_22.empty
    no_of_passengers = @bus_22.count_passengers
    assert_equal(0, no_of_passengers)
  end

end
