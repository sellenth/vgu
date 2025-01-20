defmodule Vgu.Repo do
  use Ecto.Repo,
    otp_app: :vgu,
    adapter: Ecto.Adapters.Postgres
end
