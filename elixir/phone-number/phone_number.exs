defmodule Phone do
  @invalid_number "0000000000"
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    if !String.match?(raw, ~r/[a-z]/) do
      Regex.scan(~r/\d/, raw)
      |> drop_the_one
      |> Enum.join
      |> invalid_phone_number?
    else
      @invalid_number
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    phone_number = number(raw)
    "(#{String.slice(phone_number, 0..2)}) #{String.slice(phone_number, 3..5)}-#{String.slice(phone_number,6..9)}"
  end

  defp drop_the_one(digits) when is_list(digits) do
    if Enum.count(digits) == 11 and List.first(digits) == ["1"] do
      digits = List.delete_at(digits, 0)
    end
    digits
  end
  defp drop_the_one(digits), do: digits

  defp invalid_phone_number?(phone_number) do
     case String.length(phone_number) do
       10 -> phone_number
       _ -> @invalid_number
     end
  end
end
