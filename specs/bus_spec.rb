require("minitest/autorun")
require("minitest/rg")
require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")

class BusTest < MiniTest::Test

  def setup
    @bus_22 = Bus.new(22, "Ocean Terminal")
    @person_jim = Person.new("Jim", 70)
    @person_sarah = Person.new("Sarah", 45)
    @bus_stop_clockwise = BusStop.new("Clockwise")
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
    @bus_22.pick_up(@person_jim)
    no_of_passengers = @bus_22.count_passengers
    assert_equal(1, no_of_passengers)
  end

  def test_drop_off
    @bus_22.pick_up(@person_jim)
    @bus_22.drop_off(@person_jim)
    no_of_passengers = @bus_22.count_passengers
    assert_equal(0, no_of_passengers)
  end

  def test_drop_off__person_not_found
    @bus_22.pick_up(@person_jim)
    @bus_22.drop_off(@person_sarah)
    no_of_passengers = @bus_22.count_passengers
    assert_equal(1, no_of_passengers)
  end

  def test_empty
    @bus_22.pick_up(@person_jim)
    @bus_22.pick_up(@person_sarah)
    @bus_22.empty
    no_of_passengers = @bus_22.count_passengers
    assert_equal(0, no_of_passengers)
  end

  def test_pick_up_from_stop
    @bus_stop_clockwise.add_waiting_person(@person_jim)
    @bus_stop_clockwise.add_waiting_person(@person_sarah)
    @bus_22.pick_up_from_stop(@bus_stop_clockwise)
    queue_length = @bus_stop_clockwise.queue.length
    no_of_passengers = @bus_22.count_passengers
    assert_equal(0, queue_length)
    assert_equal(2, no_of_passengers)
  end

end
