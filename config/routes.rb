Caboose::Engine.routes.draw do
  
  get     "admin"                 => "admin#index"
  put     "admin/station"         => "station#index_admin"
  get     "station"               => "station#index"
  get     "station/plugin-count"  => "station#plugin_count"
  
  get     "modal/:url" => "modal#index", :constraints => {:url => /.*/}
  
  get     "login/forgot-password"           => "login#forgot_password_form"
  post    "login/forgot-password"           => "login#send_reset_email"  
  get     "login/reset-password/:reset_id"  => "login#reset_password_form"
  post    "login/reset-password"            => "login#reset_password"  
  get     "login"                           => "login#index"
  post    "login"                           => "login#login"
  get     "logout"                          => "logout#index"
  get     "register"                        => "register#index"
  post    "register"                        => "register#register"

  get     "my-account"                      => "users#my_account"
  put     "my-account"                      => "users#update_my_account"
  
  get     "admin/users"                     => "users#index"
  get     "admin/users/options"             => "users#options"
  get     "admin/users/new"                 => "users#new"
  get     "admin/users/:id/su"              => "users#admin_su"
  get     "admin/users/:id/edit-password"   => "users#edit_password"
  get     "admin/users/:id/edit"            => "users#edit"
  put     "admin/users/:id"                 => "users#update"
  post    "admin/users"                     => "users#create"
  delete  "admin/users/:id"                 => "users#destroy"
  
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
  
  #get     "pages"                           => "pages#index"
  get     "pages/:id"                     => "pages#show"
  get     "pages/:id/redirect"            => "pages#redirect"
  get     "admin/pages/sitemap-options"   => "pages#admin_sitemap_options"
  get     "admin/pages/robots-options"    => "pages#admin_robots_options"
  get     "admin/pages/format-options"    => "pages#admin_content_format_options"
  get     "admin/pages/new"               => "pages#admin_new"
  get     "admin/pages/:id/uri"           => "pages#admin_page_uri"
  get     "admin/pages/:id/delete"        => "pages#admin_delete_form"  
  get     "admin/pages/:id/sitemap"       => "pages#admin_sitemap"
  get     "admin/pages/:id/edit"          => "pages#admin_edit_general"
  get     "admin/pages/:id/css"           => "pages#admin_edit_css"
  get     "admin/pages/:id/js"            => "pages#admin_edit_js"
  get     "admin/pages/:id/seo"           => "pages#admin_edit_seo" 
  get     "admin/pages/:id/block-order"   => "pages#admin_edit_block_order"
  put     "admin/pages/:id/block-order"   => "pages#admin_update_block_order"
  get     "admin/pages/:id/new-blocks"    => "pages#admin_new_blocks"
  get     "admin/pages/:id/content"       => "pages#admin_edit_content"  
  put     "admin/pages/:id"               => "pages#admin_update"
  get     "admin/pages"                   => "pages#admin_index"
  post    "admin/pages"                   => "pages#admin_create"  
  delete  "admin/pages/:id"               => "pages#admin_delete"
    
  get     "admin/pages/:page_id/blocks/new"        => "page_blocks#admin_new"
  get     "admin/pages/:page_id/blocks/render"     => "page_blocks#admin_render_all"
  get     "admin/pages/:page_id/blocks/:id/render" => "page_blocks#admin_render"
  get     "admin/pages/:page_id/blocks/:id/edit"   => "page_blocks#admin_edit"
  get     "admin/pages/:page_id/blocks/:id"        => "page_blocks#admin_show"
  get     "admin/pages/:page_id/blocks"            => "page_blocks#admin_index"  
  post    "admin/pages/:page_id/blocks"            => "page_blocks#admin_create"
  put     "admin/pages/:page_id/blocks/:id"        => "page_blocks#admin_update"
  delete  "admin/pages/:page_id/blocks/:id"        => "page_blocks#admin_delete"
  
  put     "admin/page-block-field-values/:id"       => "page_block_field_values#admin_update"
  post    "admin/page-block-field-values/:id/image" => "page_block_field_values#admin_update_image"
  post    "admin/page-block-field-values/:id/file"  => "page_block_field_values#admin_update_file"
    
  get     "admin/page-block-types/new"            => "page_block_types#admin_new"    
  get     "admin/page-block-types/:id/edit"       => "page_block_types#admin_edit"
  get     "admin/page-block-types/:id"            => "page_block_types#admin_show"
  get     "admin/page-block-types"                => "page_block_types#admin_index"
  post    "admin/page-block-types"                => "page_block_types#admin_create"  
  put     "admin/page-block-types/:id"            => "page_block_types#admin_update"
  delete  "admin/page-block-types/:id"            => "page_block_types#admin_delete"
  
  get     "admin/page-block-fields/field-type-options"            => "page_block_fields#admin_field_type_options"
  get     "admin/page-block-fields/:id/options"                   => "page_block_fields#admin_field_options"
  get     "admin/page-block-types/:block_type_id/fields/new"      => "page_block_fields#admin_new"    
  get     "admin/page-block-types/:block_type_id/fields/:id/edit" => "page_block_fields#admin_edit"
  get     "admin/page-block-types/:block_type_id/fields/:id"      => "page_block_fields#admin_index"
  post    "admin/page-block-types/:block_type_id/fields"          => "page_block_fields#admin_create"  
  put     "admin/page-block-types/:block_type_id/fields/:id"      => "page_block_fields#admin_update"
  delete  "admin/page-block-types/:block_type_id/fields/:id"      => "page_block_fields#admin_delete"
  
  get     "posts"                                 => "posts#index"
  get     "posts/:id"                             => "posts#detail"
  get     "admin/posts/category-options"          => "posts#admin_category_options"
  get     "admin/posts/new"                       => "posts#admin_new"
  get     "admin/posts/:id/delete"                => "posts#admin_delete_form"
  get     "admin/posts/:id/edit"                  => "posts#admin_edit_general"
  get     "admin/posts/:id/content"               => "posts#admin_edit_content"
  get     "admin/posts/:id/categories"            => "posts#admin_edit_categories"
  get     "admin/posts/:id/add-to-category"       => "posts#admin_add_to_category"
  get     "admin/posts/:id/remove-from-category"  => "posts#admin_remove_from_category"
  get     "admin/posts/:id/delete"                => "posts#admin_delete_form"
  put     "admin/posts/:id"                       => "posts#admin_update"
  post    "admin/posts/:id"                       => "posts#admin_update"
  get     "admin/posts"                           => "posts#admin_index"
  post    "admin/posts"                           => "posts#admin_add"  
  delete  "admin/posts/:id"                       => "posts#admin_delete"

  get     "admin/ab-variants"                     => "ab_variants#admin_index"
  get     "admin/ab-variants/new"                 => "ab_variants#admin_new"
  get     "admin/ab-variants/:id"                 => "ab_variants#admin_edit"
  put     "admin/ab-variants/:id"                 => "ab_variants#admin_update"
  post    "admin/ab-variants"                     => "ab_variants#admin_create"  
  delete  "admin/ab-variants/:id"                 => "ab_variants#admin_delete"
  
  get     "admin/ab-variants/:variant_id/options" => "ab_options#admin_index"    
  put     "admin/ab-options/:id"                  => "ab_options#admin_update"
  post    "admin/ab-variants/:variant_id/options" => "ab_options#admin_create"
  delete  "admin/ab-options/:id"                  => "ab_options#admin_delete"
  
  match '*path' => 'pages#show'
  root :to => 'pages#show'
  
end
