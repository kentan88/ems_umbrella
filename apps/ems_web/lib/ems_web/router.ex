defmodule EMSWeb.Router do
  use EMSWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    # plug(GraphQL.Context)
  end

  scope "/" do
    pipe_through(:api)
    forward("/api", Absinthe.Plug, schema: API.Schema)
    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: API.Schema)
  end

  scope "/", EMSWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", EMSWeb do
  #   pipe_through :api
  # end
end
