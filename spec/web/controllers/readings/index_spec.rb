RSpec.describe Web::Controllers::Readings::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { ReadingRepository.new }

  before do
    repository.clear

    @past_reading = repository.create(title: 'TDD', author: 'Kent Beck', meeting_date: 1.week.ago, url: "http://www.com")
    @future_reading = repository.create(title: 'hihihihi', author: 'aaaaaaaaa', meeting_date: 1.week.from_now, url: "http://www.com")
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all readings' do
    action.call(params)
    expect(action.exposures[:next_reading]).to eq([@future_reading])
    expect(action.exposures[:past_reading]).to eq([@past_reading])
  end
end
