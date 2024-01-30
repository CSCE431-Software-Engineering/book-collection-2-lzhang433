# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book with all valid fields: ', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'harry potter'
    fill_in 'book[author]', with: 'jk rowling'
    fill_in 'book[price]', with: 3.00
    fill_in 'book[published_date]', with: Date.today
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end

RSpec.describe 'Creating a book with title: ', type: :feature do
    scenario 'invalid inputs' do
      visit new_book_path
      fill_in 'book[title]', with: ' '
      fill_in 'book[author]', with: 'jk rowling'
      fill_in 'book[price]', with: 3.00
      fill_in 'book[published_date]', with: Date.today
      click_on 'Create Book'
      expect(page).to have_content('error')
    end
  end

RSpec.describe 'Creating a book with author: ', type: :feature do
    scenario 'invalid inputs' do
      visit new_book_path
      fill_in 'book[title]', with: 'harry potter'
      fill_in 'book[author]', with: ' '
      fill_in 'book[price]', with: 3.00
      fill_in 'book[published_date]', with: Date.today
      click_on 'Create Book'
      expect(page).to have_content('error')
    end
  end

RSpec.describe 'Creating a book with price: ', type: :feature do
    scenario 'invalid inputs' do
      visit new_book_path
      fill_in 'book[title]', with: 'harry potter'
      fill_in 'book[author]', with: 'jk rowling'
      fill_in 'book[price]', with: -3.00
      fill_in 'book[published_date]', with: Date.today
      click_on 'Create Book'
      expect(page).to have_content('error')
    end
  end
  
RSpec.describe 'Creating a book with published date: ', type: :feature do
    scenario 'invalid inputs' do
      visit new_book_path
      fill_in 'book[title]', with: 'harry potter'
      fill_in 'book[author]', with: 'jk rowling'
      fill_in 'book[price]', with: 3.00
      fill_in 'book[published_date]', with: Date.tomorrow
      click_on 'Create Book'
      expect(page).to have_content('error')
    end
  end