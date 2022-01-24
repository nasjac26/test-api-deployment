class User < ApplicationRecord
    has_secure_password
    before_save :downcase_email


    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email or it is already being used. Please try another!' }
    validates :password, presence: true, confirmation: true
    attribute :licenced, :boolean, default: 'false'


    private

    def downcase_email
        self.email = email.downcase
    end
end
