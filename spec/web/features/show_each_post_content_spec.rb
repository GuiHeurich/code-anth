require "features_helper"

RSpec.describe 'Show posts' do
  context 'visiting posts' do
    let(:repository) { PostRepository.new }
    before do
      repository.clear

      repository.create(title: "a", author: "b", content: "c")
    end

    let(:post_id_one) { repository.all.first.id }

    it 'shows the content of the post' do
      visit "/posts/#{post_id_one}"

      within '#title' do
        expect(page).to have_content('a')
      end

      within '#content' do
        expect(page).to have_content('c')
      end
    end
  end
end
