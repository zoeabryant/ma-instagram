require 'rails_helper'

describe 'location feature' do

	context 'adding a location' do
		it 'will add a location when making a new post' do
			visit '/posts/new'
			fill_in 'Title', with: 'A brand new post'
			fill_in 'Location', with: 'London, UK'
			attach_file 'Picture', Rails.root.join('spec/images/french_cat.gif')
			click_button 'Create Post'

			expect(page).to have_content 'London, UK'
		end
	end

end