if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("gigasecond.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule GigasecondTest do
  use ExUnit.Case

  # @tag :pending
  test "from 4/25/2011" do
    assert Gigasecond.from({2011, 4, 25}) == {2043, 1, 1}
  end

  test "from 6/13/1977" do
    assert Gigasecond.from({1977, 6, 13}) == {2009, 2, 19}
  end

  test "from 7/19/1959" do
    assert Gigasecond.from({1959, 7, 19}) == {1991, 3, 27}
  end

  test "yourself" do
    # customize these values for yourself
    your_birthday = {1980, 9, 27}
    assert Gigasecond.from(your_birthday) == {2012, 6, 5}
  end
end

