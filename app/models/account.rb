class Account < ApplicationRecord
    belongs_to :user
    
    validates :user, presence: true
    validates :name, presence: true, uniqueness: {scope: :user_id}
    validates :type, presence: true
    validates :amount, presence: true
end
