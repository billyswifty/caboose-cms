Caboose::Engine.routes.draw do
  
  get     "admin"           => "admin#index"
  put     "admin/station"   => "station#index"
  
  get     "login"           => "login#index"
  post    "login"           => "login#login"
  get     "logout"          => "logout#index"
  
  get     "admin/users"                   => "users#index"
  get     "admin/users/options"           => "users#options"
  get     "admin/users/new"               => "users#new"
  post    "admin/users/:id/update-pic"    => "users#update_pic"
  get     "admin/users/:id/edit"          => "users#edit"
  put     "admin/users/:id"               => "users#update"
  post    "admin/users"                   => "users#create"
  delete  "admin/users/:id"               => "users#destroy"
  
  get     "admin/roles"                   => "roles#index"
  get     "admin/roles/options"           => "roles#options"
  get     "admin/roles/new"               => "roles#new"
  get     "admin/roles/:id/edit"          => "roles#edit"
  put     "admin/roles/:id"               => "roles#update"
  post    "admin/roles"                   => "roles#create"
  delete  "admin/roles/:id"               => "roles#destroy"
  
  get     "admin/permissions"             => "permissions#index"
  get     "admin/permissions/options"     => "permissions#options"
  get     "admin/permissions/new"         => "permissions#new"
  get     "admin/permissions/:id/edit"    => "permissions#edit"
  put     "admin/permissions/:id"         => "permissions#update"  
  post    "admin/permissions"             => "permissions#create"
  delete  "admin/permissions/:id"         => "permissions#destroy"
  
  get     "admin/settings"                => "settings#index"
  get     "admin/settings/options"        => "settings#options"
  get     "admin/settings/new"            => "settings#new"
  get     "admin/settings/:id/edit"       => "settings#edit"
  put     "admin/settings/:id"            => "settings#update"  
  post    "admin/settings"                => "settings#create"
  delete  "admin/settings/:id"            => "settings#destroy"
  
  get     "pages"                         => "pages#index"
  get     "pages/sitemap-options"         => "pages#sitemap_options"
  get     "pages/robots-options"          => "pages#robots_options"
  get     "pages/content-format-options"  => "pages#content_format_options"
  get     "pages/new"                     => "pages#new"
  get     "pages/:id/redirect"            => "pages#redirect"
  get     "pages/:id/edit-settings"       => "pages#edit_settings"
  get     "pages/:id/edit"                => "pages#edit"
  get     "pages/:id"                     => "pages#show"
  put     "pages/:id"                     => "pages#update"
  post    "pages"                         => "pages#create"
  delete  "pages/:id"                     => "pages#destroy"
  
  match '*path' => 'pages#show'
  root :to => 'pages#show'
  
end