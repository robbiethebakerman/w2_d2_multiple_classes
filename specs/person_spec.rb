require("minitest/autorun")
require("minitest/rg")
require_relative("../bus")
require_relative("../person")

class PersonTest < MiniTest::Test

  def setup
    @person1 = Person.new("Robbie", 31)
  end

  def test_get_person_name
    assert_equal("Robbie", @person1.name)
  end

  def test_get_person_age
    assert_equal(31, @person1.age)
  end

end
