
class Caboose::Post < ActiveRecord::Base
  self.table_name = "posts"
  
  has_many :post_category_memberships
  has_many :post_categories, :through => :post_category_memberships
  belongs_to :site
  
  attr_accessible :id,
    :site_id,
    :category_id, 
    :title, 
    :body, 
    :published,
    :created_at
  has_attached_file :image, 
    :path => 'posts/:id_:style.:extension', 
    :styles => {
      :tiny  => '75x75>',
      :thumb => '150x150>',
      :large => '400x400>'
    }
  do_not_validate_attachment_file_type :image

end
