defmodule ChekmonWeb.UserView do
  use ChekmonWeb, :view

  def password_display(nil), do: ""
  def password_display(password), do: "******"
end
