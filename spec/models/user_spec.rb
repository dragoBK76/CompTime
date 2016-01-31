require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'requires a password confirmation to be the same as password' do
      user = User.new(password: "lol", password_confirmation: "lolno")
      user.valid?

      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
