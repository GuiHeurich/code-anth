'# frozen_string_literal: true'
RSpec.describe UserRepository, type: :repository do
  describe '#create' do
    let(:user_data) do
      {password: 'hashed password'}
    end

    it 'creates a user with a password' do
      user = subject.create(user_data)
      expect(user.password).to eq(user_data[:password])
    end
  end
end
