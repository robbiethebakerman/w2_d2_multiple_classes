require("minitest/autorun")
require("minitest/rg")
require_relative("../bus_stop")
require_relative("../bus")
require_relative("../person")

class BusStopTest < MiniTest::Test

  def setup
    @bus_stop_clockwise = BusStop.new("Clockwise")
    @person_robbie = Person.new("Robbie", 31)
    @person_kirstie = Person.new("Kirstie", 31)
    @bus_22_a = Bus.new(22, "Ocean_Terminal")
  end

  def test_get_bus_stop_name
    assert_equal("Clockwise", @bus_stop_clockwise.name)
  end

  def test_add_waiting_person
    @bus_stop_clockwise.add_waiting_person(@person_robbie)
    queue_length = @bus_stop_clockwise.queue.length
    assert_equal(1, queue_length)
  end

  def test_empty_queue
    @bus_stop_clockwise.add_waiting_person(@person_robbie)
    @bus_stop_clockwise.add_waiting_person(@person_kirstie)
    @bus_stop_clockwise.empty_queue
    queue_length = @bus_stop_clockwise.queue.length
    assert_equal(0, queue_length)
  end

end
