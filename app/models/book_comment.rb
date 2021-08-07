class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
    
 
  validates :user_comment, presence: true
  
end
