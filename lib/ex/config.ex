defmodule Ex.Config do
  @moduledoc """
  Extended functionalities for the module `Config`.
  """

  @doc """
  Checks whether the environment is a local environment, local environments
  are: `:dev`, `:doc` and `:test`.
  """
  @spec is_local?(:dev | :doc | :test | atom) :: boolean

  def is_local?(:dev), do: true
  def is_local?(:doc), do: true
  def is_local?(:test), do: true
  def is_local?(_), do: false

  @doc """
  Checks whether the environment is a non-local environment.
  """
  @spec is_remote?(:dev | :doc | :test | atom) :: boolean

  def is_remote?(env), do: not is_local?(env)

  @doc """
  Same as `System.get_env/1` or `System.get_env/2` but unlike in those
  functions the variable's value is trimmed and, if the value is empty,
  then the default value is returned.
  """
  @spec env(name :: String.t(), default :: nil | String.t()) :: String.t() | nil

  def env(<<_, _::binary>> = name, default \\ nil)
      when is_nil(default)
      when is_binary(default) do
    default = if not is_nil(default), do: String.trim(default)
    value = System.get_env(name, "") |> String.trim()

    case String.length(value) > 0 do
      true -> value
      false -> default
    end
  end

  @doc """
  Checked whether a flag environment variable is present and enabled.
  The values considered as "enabled" are: "true" and "1" (case-insensitive).
  """
  @spec flag_enabled?(name :: String.t(), default :: boolean) :: boolean

  def flag_enabled?(<<_, _::binary>> = name, default \\ false)
      when is_boolean(default) do
    case env(name) do
      nil -> default
      value -> String.downcase(value) in ["true", "1"]
    end
  end
end
