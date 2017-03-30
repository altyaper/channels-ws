defmodule Channels.PageController do
  use Channels.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def vote(conn, _params) do
    render conn, "vote.html"
  end

end
