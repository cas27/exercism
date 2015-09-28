defmodule Meetup do
  @days_of_week %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7}
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    range = case schedule do
              :teenth -> 13..19
              :first -> 1..7
              :second -> 8..14
              :third -> 15..21
              :fourth -> 22..28
              :last -> Range.new(:calendar.last_day_of_the_month(year, month) - 6, :calendar.last_day_of_the_month(year, month))
    end
    [day_of_the_month] = Enum.filter(range, &day_match?({year, month, &1}, weekday))
    {year, month, day_of_the_month}
  end

  defp day_match?(date, weekday) do
    :calendar.day_of_the_week(date) == @days_of_week[weekday]
  end
end
