defmodule VguWeb.PageController do
  use VguWeb, :controller

  def home(conn, _params) do
    latest_post = Blog.get_latest_post()
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, latest_post: latest_post)
  end
end
