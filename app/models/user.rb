class User < ApplicationRecord
  #ASSOCIATIONS 
  has_many :tips, dependent: :destroy 
  has_many :lesson_topics, through: :tips 
  
  
  #VALIDATIONS
  before_save { self.email = email.downcase }  #this appears unnecessary, however, as the email address is being indexed, the index may be case sensitive.  To not worry about this the email address is standardized prior to going in the db. 
  validates :name, presence: true, length: {maximum: 255}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
   format: { with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,  length: {minimum: 6}, allow_nil: true 
  validates  :has_graduated, presence: true 


  #TESTING 
  def User.digest(string)  #needed to set up fixtures/users.yml Uses low 
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
