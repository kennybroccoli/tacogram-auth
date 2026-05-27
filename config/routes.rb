Rails.application.routes.draw do
  resources "posts"
  resources "sessions"
  resources "users"

  get "/icon.png", to: ->(_env) { [204, { "Content-Type" => "image/png" }, []] }

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  # TODO: map landing page (aka root route) to controller and action
  # get("/", {:controller => "", :action => ""})
end
