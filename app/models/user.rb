class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates_confirmation_of :password
  validates :password, length: { in: 8..20 },
                       presence: true, :on => :create
  validates :email,    presence: true,
                       format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                       uniqueness: true

  scope :admin_users, -> { where( role: 'admin' ).select( :id, :email, :role, :active ) }
  scope :sample_users, -> { where( role: 'user' ).select( :id, :email, :role, :active ) }
  scope :inactive_users, -> { where( active: false ).select( :id, :email, :role, :active ) }
  scope :all_users, -> { select( :id, :email, :role, :active ) }

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
