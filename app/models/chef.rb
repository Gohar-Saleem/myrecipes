class Chef < ApplicationRecord
    before_save { self.email=email.downcase }
    validates :chefname, presence: true, length: {maximum: 30}
    validates :email, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
    has_many :recipes, dependent: :destroy
    has_secure_password
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true
    has_many :comments, dependent: :destroy
end