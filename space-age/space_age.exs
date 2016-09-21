defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds_in_year = 365.25 * 24 * 60 * 60
    %{
      earth: seconds_in_year,
      mercury: 0.2408467 * seconds_in_year,
      venus: 0.61519726 * seconds_in_year,
      mars: 1.8808158 * seconds_in_year,
      jupiter: 11.862615 * seconds_in_year,
      saturn: 29.447498 * seconds_in_year,
      uranus: 84.016846 * seconds_in_year,
      neptune: 164.79132 * seconds_in_year
    }
    |> Map.fetch!(planet)
    |> (&(seconds / &1)).()
  end
end
