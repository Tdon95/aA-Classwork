# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_digest, presence: { message: 'Password can\'t be blank'}
    validates :session_token, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    attr_reader :password
    after_initialize :ensure_session_token

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end
    
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        # return nil is user.nil?
        # user.is_password?(password) ? user : nil
        return nil unless user && user.is_password?(password)
        user
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end
    
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    private
    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
