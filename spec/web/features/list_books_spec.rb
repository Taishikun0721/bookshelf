require 'features_helper'

RSpec.describe 'display each books on the page' do
  it 'is displays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page).to have_css('.book', count: 2)
    end
  end
end