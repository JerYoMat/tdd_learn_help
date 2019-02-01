require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:test_user_1)
    @user2=User.new( name: 'michael',
                     email: 'michael@testusermodel.com', password: password, password_confirmation: password_confirmation) 
  end 

  test 'should be valid'  do
    assert @user1.valid?  
  end 
  test 'user name  is required' do
    @user2.name = '   ' 
    assert_not @user2.save 
  end 
  test 'unique email address is required' do 
  end 
  test 'email address is plausible' do 
    valid_email_addresses = %w[test1@example.com TEST@EXAMPLE.CoM with.period@999.com FOREIGN@Gruen.de]
    valid_email_addresses.each do |single_address|
      assert @user.valid?, "#{single_address.inspect} should be valid"  #this is a custome error message
    end 
  end 
  test 'password matches password_confirmation and length exceeds 7' do 
  end 
  test 'has_graduated is present' do 
  end 






end
