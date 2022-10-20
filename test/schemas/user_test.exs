defmodule Spiderslab.UserTest do
  use Spiderslab.RepoCase

  test "create user" do
    user = Spiderslab.Repo.insert!(%Spiderslab.User{first_name: "Johnny"})
    new_user = Spiderslab.Repo.get!(Spiderslab.User, user.id)

    assert new_user.first_name == "Johnny"
  end
end
