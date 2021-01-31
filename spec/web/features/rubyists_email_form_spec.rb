require "features_helper"

RSpec.describe 'Receive email from rubyist' do
  it 'sends an email after clicking the form' do
    visit '/'
    fill_in 'new-interlocutor-email', with: 'johnny@johnny.com'
    click_on '#MINASWAN'

    expect(page).to have_selector('.thank_you', count: 1), "Thanks. We'll be in touch!"
  end
end
