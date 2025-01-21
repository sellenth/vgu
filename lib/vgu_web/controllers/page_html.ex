defmodule VguWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use VguWeb, :html

  import Phoenix.Component
  import Phoenix.HTML
  import VguWeb.CoreComponents

  embed_templates "page_html/*"
end
