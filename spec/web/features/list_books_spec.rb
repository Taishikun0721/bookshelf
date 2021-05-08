require 'features_helper'

RSpec.describe 'display each books on the page' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear

    repository.create(title: 'PoEAA', author: 'Martin Fowler')
    repository.create(title: 'TDD',   author: 'Kent Beck')
  end
  it 'is displays each book on the page' do

    visit '/books'

    within '#books' do
      expect(page).to have_css('.book', count: 2)
    end
  end
end