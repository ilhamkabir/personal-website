class User < ApplicationRecord
    # scope :active_users -> { where(active: true) }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :email, :uniqueness => { :case_sensitive => false }
    
    has_many :blogs
end
