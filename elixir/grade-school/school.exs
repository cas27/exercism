defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do
    Map.update(db, grade, [name], &(&1 ++ [name]))
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do
    case Map.fetch(db, grade) do
      {:ok, result} -> result
      _ -> []
    end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db) do
    db
    |> Map.keys
    |> Enum.sort
    |> build_sorted_map(db)
  end

  defp build_sorted_map(sorted_grades, db) do
    Enum.reduce(sorted_grades, %{}, fn(grade,acc) ->
      Map.put(acc, grade, Enum.sort(grade(db,grade)))
    end)
  end
end
