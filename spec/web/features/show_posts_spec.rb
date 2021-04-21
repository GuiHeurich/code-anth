require "features_helper"

RSpec.describe 'Show posts' do
  context 'visiting posts' do
    let(:repository) { PostRepository.new }
    before do
      repository.clear

      repository.create(title: "world", author: "b", content: "c")
      repository.create(title: "hello", author: "e", content: "f")
    end

    it 'shows the title of each post' do
      visit '/posts'

      expect(page.html).to include("world")
      expect(page.html).to include("hello")
    end
  end
end
