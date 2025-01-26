defmodule VguWeb.PostLive.Edit do
  use VguWeb, :live_view

  alias Vgu.Blog

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    post = Blog.get_post!(id)
    changeset = Blog.change_post(post)

    # Initialize the preview HTML
    preview_html = Earmark.as_html!(changeset.changes[:content] || post.content)

    {:ok,
     socket
     |> assign(:post, post)
     |> assign(:changeset, changeset)
     |> assign(:preview_html, preview_html)}
  end

  @impl true
  def handle_event("update_preview", %{"post" => %{"content" => content}}, socket) do
    # Render the markdown content to HTML
    preview_html = Earmark.as_html!(content)

    # Update the preview in the socket
    {:noreply, assign(socket, :preview_html, preview_html)}
  end
end
