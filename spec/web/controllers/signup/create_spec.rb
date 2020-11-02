RSpec.describe Web::Controllers::SignUp::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) do 
    Hash[
      email: 'code@anth.com',
      password: 'codeanth12345',
      invite: 'malinowski'
    ] 
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  context 'without an invite' do
    before do
      params.delete(:invite)
    end

    it 'is unsuccessful' do
      response = action.call(params)
      expect(response[0]).to eq 400
    end
  end

  context 'without an email' do
    before do
      params.delete(:email)
    end

    it 'is unsuccessful' do
      response = action.call(params)
      expect(response[0]).to eq 400
    end
  end

  context 'without password' do
    before do
      params.delete(:password)
    end

    it 'is unsuccessful' do
      response = action.call(params)
      expect(response[0]).to eq 400
    end
  end
end