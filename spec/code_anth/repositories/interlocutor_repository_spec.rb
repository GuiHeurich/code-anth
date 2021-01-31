require 'spec_helper'

RSpec.describe InterlocutorRepository, type: :repository do
  let(:email) { 'gui@gui.com' }
  let(:entry) {
    {
      email: email
    }
  }

  context "#count" do
    it 'counts the number of records' do
      subject.create(entry)
      expect(subject.count).to eq 1
    end
  end
end
