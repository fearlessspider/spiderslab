defmodule Spiderslab.User do
  use Spiderslab.Schema

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)
  end
end