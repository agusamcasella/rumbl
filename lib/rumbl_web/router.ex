defmodule RumblWeb.Router do
  use RumblWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {RumblWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug RumblWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # para ver todas las rutas de la app correr
  # en consola  mix phx.routes
  scope "/", RumblWeb do
    pipe_through :browser
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show

  end

  scope "/manage", RumblWeb do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
  end

  # la anterior declaracion con el resources es equivalente a lo siguiente
  # get "/users", UserController, :index
  # get "/users/:id/edit", UserController, :edit
  # get "/users/new", UserController, :new
  # get "/users/:id", UserController, :show
  # post "/users", UserController, :create
  # patch "/users/:id", UserController, :update
  # put "/users/:id", UserController, :update
  # delete "/users/:id", UserController, :delete

  # Other scopes may use custom stacks.
  # scope "/api", RumblWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: RumblWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
