require "features_helper"

RSpec.describe 'Show posts' do
  context 'visiting posts' do
    let(:repository) { PostRepository.new }
    before do
      repository.clear

      repository.create(title: "a", author: "b", content: "c")
      repository.create(title: "d", author: "e", content: "f")
    end

    it 'shows the title and first paragraph of each post' do
      visit '/posts'

      within '#posts' do
        expect(page).to have_selector('.post', count: 2)
      end
    end
  end
end
