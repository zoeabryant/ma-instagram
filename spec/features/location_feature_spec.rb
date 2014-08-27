require 'rails_helper'

describe 'location feature' do

	let(:post_title)	{ 'A brand new post' }
	let(:post_location) { 'London, UK' }
	let(:post_image)	{ Rails.root.join('spec/images/french_cat.gif') }

	before do
		zoe = create(:user)
		sign_in(zoe)
	end

	def add_post
		visit '/posts/new'
		fill_in 'Title', with: post_title
		fill_in 'Location', with: post_location
		attach_file 'Picture', post_image
		click_button 'Create Post'
	end

	context 'adding a location' do
		it 'will add a location when making a new post' do
			add_post

			expect(page).to have_content post_location
		end

		# xit 'can determine your location when making a new post', js:true do
		# 	# I tried I swear! Must include JS dependencies in Poltergeist.
		# 	visit '/posts/new'

		# 	click_button 'Get Location'

		# 	london_lat = '51.5073509'
		# 	london_lng = '-0.1277582'

		# 	page.execute_script("getLocationName(#{london_lat}, #{london_lng})');")

		# 	expect(page).to have_selector("input[value='25 City Road, London EC1Y 1AA, UK']")
		# end
	end

	context 'a post with a location' do
		before do
			add_post
		end

		it 'you can click on the location to view a map' do
			click_link post_location
			expect(page).to have_content "#{post_title} #{post_location}"
		end

		it 'you can see the map in the page', js: true do
			click_link post_location
			expect(page).to have_css '#map .gm-style'
		end
	end

end