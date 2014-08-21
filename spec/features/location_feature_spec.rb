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

	context 'a post with a location' do
		before do
			visit '/posts/new'
			fill_in 'Title', with: 'A brand new post'
			fill_in 'Location', with: 'London, UK'
			attach_file 'Picture', Rails.root.join('spec/images/french_cat.gif')
			click_button 'Create Post'
		end

		it 'you can click on the location to view a map' do
			click_link 'London, UK'
			expect(page).to have_content 'A brand new post posted from London, UK'
		end

		it 'you can see the map in the page', js: true do
			click_link 'London, UK'
			expect(page).to have_css '#map .gm-style'
		end
	end

end