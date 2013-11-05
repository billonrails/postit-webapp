class Post < ActiveRecord::Base
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	has_many :comments 
	has_many :post_categories
	has_many :categories, through: :post_categories

# the :creator is just a more descriptive association

# this states you must have a title to save to the database
validates :title, presence: true
end