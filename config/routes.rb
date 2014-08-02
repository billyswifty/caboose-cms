Caboose::Engine.routes.draw do
  
  get     "admin"                 => "admin#index"
  put     "admin/station"         => "station#index_admin"
  get     "station"               => "station#index"
  get     "station/plugin-count"  => "station#plugin_count"
  
  get "modal"      => "modal#layout"
  get "modal/:url" => "modal#index", :constraints => {:url => /.*/}
  
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
  
  post    "admin/sites/:id/members"            => "sites#admin_add_member"
  delete  "admin/sites/:id/members/:user_id"   => "sites#admin_remove_member"
  
  post    "admin/sites/:id/domains"                        => "sites#admin_add_domain"
  put     "admin/sites/:id/domains/:domain_id/set-primary" => "sites#admin_set_primary_domain"
  delete  "admin/sites/:id/domains/:domain_id"             => "sites#admin_remove_domain"
                                                                                                                                     
  get     "admin/sites/options"              => "sites#options"
  get     "admin/sites"                      => "sites#admin_index"    
  get     "admin/sites/new"                  => "sites#admin_new"  
  get     "admin/sites/:id"                  => "sites#admin_edit"  
  put     "admin/sites/:id"                  => "sites#admin_update"  
  post    "admin/sites"                      => "sites#admin_add"  
  delete  "admin/sites/:id"                  => "sites#admin_delete"
    
  get     "admin/redirects"      => "redirects#admin_index"    
  get     "admin/redirects/new"  => "redirects#admin_new"  
  get     "admin/redirects/:id"  => "redirects#admin_edit"  
  put     "admin/redirects/:id"  => "redirects#admin_update"  
  post    "admin/redirects"      => "redirects#admin_add"  
  delete  "admin/redirects/:id"  => "redirects#admin_delete"
  
  get     "admin/users"                     => "users#index"  
  get     "admin/users/options"             => "users#options"
  get     "admin/users/new"                 => "users#new"
  get     "admin/users/import"              => "users#import_form"
  post    "admin/users/import"              => "users#import"  
  get     "admin/users/:id/su"              => "users#admin_su"
  get     "admin/users/:id/edit-password"   => "users#edit_password"
  get     "admin/users/:id/edit"            => "users#edit"  
  put     "admin/users/:id"                 => "users#update"
  post    "admin/users"                     => "users#create"
  delete  "admin/users/:id"                 => "users#destroy"
  
  post    "admin/users/:id/roles/:role_id"  => "users#add_to_role"  
  delete  "admin/users/:id/roles/:role_id"  => "users#remove_from_role"
  
  get     "admin/roles"                   => "roles#index"
  get     "admin/roles/options"           => "roles#options"
  get     "admin/roles/new"               => "roles#new"
  get     "admin/roles/:id/edit"          => "roles#edit"
  put     "admin/roles/:id"               => "roles#update"
  post    "admin/roles"                   => "roles#create"
  delete  "admin/roles/:id"               => "roles#destroy"
  
  post    "admin/roles/:id/permissions/:permission_id"  => "roles#add_permission"  
  delete  "admin/roles/:id/permissions/:permission_id"  => "roles#remove_permission"
  
  get     "admin/images"                => "images#admin_index"
  get     "admin/images/s3"             => "images#admin_sign_s3"
  get     "admin/images/s3-result"      => "images#admin_s3_result"  
  get     "admin/images/new"            => "images#admin_new"
  get     "admin/images/:id/process"    => "images#admin_process"
  get     "admin/images/:id"            => "images#admin_edit"  
  put     "admin/images/:id"            => "images#admin_update"
  post    "admin/images/:id/image"      => "images#admin_update_image"  
  post    "admin/images"                => "images#admin_add"
  delete  "admin/images/:id"            => "images#admin_delete"
  
  
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
  get     "admin/pages/:id/block-options" => "pages#admin_block_options"
  get     "admin/pages/:id/uri"           => "pages#admin_page_uri"
  get     "admin/pages/:id/delete"        => "pages#admin_delete_form"  
  get     "admin/pages/:id/sitemap"       => "pages#admin_sitemap"
  get     "admin/pages/:id/edit"          => "pages#admin_edit_general"
  get     "admin/pages/:id/permissions"   => "pages#admin_edit_permissions"
  get     "admin/pages/:id/css"           => "pages#admin_edit_css"
  get     "admin/pages/:id/js"            => "pages#admin_edit_js"
  get     "admin/pages/:id/seo"           => "pages#admin_edit_seo" 
  get     "admin/pages/:id/block-order"   => "pages#admin_edit_block_order"
  put     "admin/pages/:id/block-order"   => "pages#admin_update_block_order"
  get     "admin/pages/:id/child-order"   => "pages#admin_edit_child_sort_order"
  put     "admin/pages/:id/child-order"   => "pages#admin_update_child_sort_order"
  get     "admin/pages/:id/new-blocks"    => "pages#admin_new_blocks"
  get     "admin/pages/:id/content"       => "pages#admin_edit_content"
  get     "admin/pages/:id/layout"        => "pages#admin_edit_layout"
  put     "admin/pages/:id/layout"        => "pages#admin_update_layout"
  put     "admin/pages/:id/viewers"       => "pages#admin_update_viewers"
  put     "admin/pages/:id/editors"       => "pages#admin_update_editors"  
  put     "admin/pages/:id"               => "pages#admin_update"
  get     "admin/pages"                   => "pages#admin_index"
  post    "admin/pages"                   => "pages#admin_create"  
  delete  "admin/pages/:id"               => "pages#admin_delete"
  
  post    "admin/page-permissions"        => "page_permissions#admin_add"  
  delete  "admin/page-permissions"        => "page_permissions#admin_delete"
  delete  "admin/page-permissions/:id"    => "page_permissions#admin_delete"  
    
  get     "admin/pages/:page_id/blocks/new"                  => "blocks#admin_new"  
  get     "admin/pages/:page_id/blocks/tree"                 => "blocks#admin_tree"
  get     "admin/pages/:page_id/blocks/render"               => "blocks#admin_render_all"
  get     "admin/pages/:page_id/blocks/render-second-level"  => "blocks#admin_render_second_level"
  get     "admin/pages/:page_id/blocks/:id/render"           => "blocks#admin_render"
  get     "admin/pages/:page_id/blocks/:id/tree"             => "blocks#admin_tree"
  get     "admin/pages/:page_id/blocks/:id/render"           => "blocks#admin_render"  
  get     "admin/pages/:page_id/blocks/:id/edit"             => "blocks#admin_edit"
  get     "admin/pages/:page_id/blocks/:id/advanced"         => "blocks#admin_edit_advanced"
  put     "admin/pages/:page_id/blocks/:id/move-up"          => "blocks#admin_move_up"
  put     "admin/pages/:page_id/blocks/:id/move-down"        => "blocks#admin_move_down"
  get     "admin/pages/:page_id/blocks/:id"                  => "blocks#admin_show"
  get     "admin/pages/:page_id/blocks"                      => "blocks#admin_index"  
  post    "admin/pages/:page_id/blocks"                      => "blocks#admin_create"
  get     "admin/pages/:page_id/blocks/:id/new"              => "blocks#admin_new"
  post    "admin/pages/:page_id/blocks/:id"                  => "blocks#admin_create"  
  put     "admin/pages/:page_id/blocks/:id"                  => "blocks#admin_update"
  delete  "admin/pages/:page_id/blocks/:id"                  => "blocks#admin_delete"
  
  put     "admin/pages/:page_id/blocks/:id"        => "blocks#admin_update"
  post    "admin/pages/:page_id/blocks/:id/image"  => "blocks#admin_update_image"
  post    "admin/pages/:page_id/blocks/:id/file"   => "blocks#admin_update_file"
  
  #put     "admin/blocks/:id"                       => "fields#admin_update"
  #post    "admin/blocks/:id/image"                 => "fields#admin_update_image"
  #post    "admin/blocks/:id/file"                  => "fields#admin_update_file"    
  
  get     "admin/block-types/store/sources"              => "block_type_sources#admin_index"
  get     "admin/block-types/store/sources/new"          => "block_type_sources#admin_new"
  get     "admin/block-types/store/sources/options"      => "block_type_sources#admin_options"
  get     "admin/block-types/store/sources/:id/edit"     => "block_type_sources#admin_edit"    
  get     "admin/block-types/store/sources/:id/refresh"  => "block_type_sources#admin_refresh"
  post    "admin/block-types/store/sources"              => "block_type_sources#admin_create"
  put     "admin/block-types/store/sources/:id"          => "block_type_sources#admin_update"
  delete  "admin/block-types/store/sources/:id"          => "block_type_sources#admin_delete"
  
  get     "admin/block-types/store/:block_type_summary_id/download"  => "block_type_store#admin_download"  
  get     "admin/block-types/store/:block_type_summary_id"           => "block_type_store#admin_details"  
  get     "admin/block-types/store"                                  => "block_type_store#admin_index"
      
  get     "admin/block-types/field-type-options"   => "block_types#admin_field_type_options"
  get     "admin/block-types/tree-options"         => "block_types#admin_tree_options"
  get     "admin/block-types/options"              => "block_types#admin_options"
  get     "admin/block-types/new"                  => "block_types#admin_new"  
  get     "admin/block-types/:id/new"              => "block_types#admin_new"  
  get     "admin/block-types/:id/options"          => "block_types#admin_value_options"
  get     "admin/block-types/:id/edit"             => "block_types#admin_edit"
  get     "admin/block-types/:id"                  => "block_types#admin_show"
  get     "admin/block-types"                      => "block_types#admin_index"
  post    "admin/block-types"                      => "block_types#admin_create"  
  put     "admin/block-types/:id"                  => "block_types#admin_update"
  delete  "admin/block-types/:id"                  => "block_types#admin_delete"
  
  get     "admin/block-type-categories/tree-options" => "block_type_categories#admin_tree_options"
    
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
  post    "admin/posts/:id/image"                 => "posts#admin_update_image"
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
  
  # API
  get "caboose/block-types"       => "block_types#api_block_type_list"
  get "caboose/block-types/:name" => "block_types#api_block_type"
        
  match '*path' => 'pages#show'
  root :to => 'pages#show'
  
end
