defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    {_, new_db} =
      Map.get_and_update(db, grade, fn current_value ->
        {current_value, [name | current_value || []]}
      end)
    new_db
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    Map.to_list(db)
    |> Enum.map(fn ({grade, names}) -> {grade, Enum.sort(names)} end)
  end
end
