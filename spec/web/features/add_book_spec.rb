require 'features_helper'

RSpec.describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    fill_in 'Title', with: 'Example book'
    fill_in 'Author', with: 'Some author'

    click_button 'Create'
    expect(current_path).to eq '/books'
  end
end