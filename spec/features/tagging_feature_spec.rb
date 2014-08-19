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

	describe 'filter by tags' do
		before do
			Post.create(title: 'Post A', tag_list: '#birds, #pretty')
			Post.create(title: 'Post B', tag_list: '#birds, #bob')
		end

		it 'filters to show only relevant tagged posts' do
			visit '/posts'
			click_link '#pretty'

			expect(page).to have_css 'h1', text: 'Posts tagged with #pretty'
			expect(page).to have_content 'Post A'
			expect(page).not_to have_content 'Post B'
		end
	end

end