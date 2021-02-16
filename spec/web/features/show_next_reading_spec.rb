require "features_helper"

RSpec.describe 'Show next reading' do
  let(:repository) { ReadingRepository.new }

  before do
    repository.clear

    repository.create(
      title: "Lego Land 2",
      author: "Adailton de Sousa",
      url: "www.legoland.com",
      meeting_date: 2.weeks.from_now)
    repository.create(
      title: "Lego Land",
      author: "Adailton de Sousa",
      url: "www.legoland.com",
      meeting_date: 2.weeks.from_now)
    repository.create(
      title: "Anarchist cookbook",
      author: "Kropotkin",
      url: 'www.anarchy.com',
      meeting_date: 1.week.ago)
    repository.create(
      title: "Rita's stories",
      author: "Rita",
      url: 'www.rita.com',
      meeting_date: 2.weeks.ago)
  end

  it 'displays future readings' do
    visit '/readings'

    within '#readings' do
      expect(page).to have_selector('.next_reading', count: 2), 'Expected to find two readings'
    end
  end
end
