require 'spec_helper'

RSpec.describe Web::Controllers::Interlocutors::Create, type: :action do
  let(:action) { described_class.new }
  let(:new_interlocutor) { { email: 'ruby@ruby.com' } }
  let(:params) { Hash[new_interlocutor: new_interlocutor] }
  let(:repository) { InterlocutorRepository.new }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'stores contributors emails' do
    action.call(params)
    expect(repository.count).to eq 1
  end
end
