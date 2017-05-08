class Account < ApplicationRecord
    belongs_to :user
    
    validates :user, presence: true
    validates :name, presence: true
    validates :description, presence: true
end
