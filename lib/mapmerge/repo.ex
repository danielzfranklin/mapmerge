defmodule Mapmerge.Repo do
  use Ecto.Repo,
    otp_app: :mapmerge,
    adapter: Ecto.Adapters.Postgres
end
