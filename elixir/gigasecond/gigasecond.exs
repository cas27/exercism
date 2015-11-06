defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from(date) do
    :calendar.date_to_gregorian_days(date) + 11574
    |> :calendar.gregorian_days_to_date
	end
end
