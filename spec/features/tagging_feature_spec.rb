require 'rails_helper'

describe 'tagging' do

	it 'displays tags as links under posts' do
		visit '/posts/new'
		fill_in 'Title', with: 'A brand new post'
		fill_in 'Tags', with: '#french, #pretty'
		click_button 'Create Post'

		expect(page).to have_link '#french'
		expect(page).to have_link '#pretty'
	end

end