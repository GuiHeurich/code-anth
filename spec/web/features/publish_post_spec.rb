require "features_helper"

RSpec.describe 'Publish post' do
  context 'visit posts' do
    it 'is successfull' do
      visit '/posts'
      expect(page).to have_content('Writings')
    end
  end
end
