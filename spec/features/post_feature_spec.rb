require 'rails_helper'

describe 'posts' do

	context 'no posts' do
	  it 'shows a message' do
	  	visit '/posts'
	  	expect(page).to have_content 'No posts yet'
	  end
	end

	context 'with posts' do
		before do
			Post.create(title: 'Hello World')
		end

		it 'displays a list of all posts' do
			visit '/posts'
			expect(page).to have_content 'Hello World'
		end
	end

	describe 'creating posts' do

	  it 'adds the post from a form' do
	  	visit '/posts'
	  	click_link 'New Post'
	  	fill_in 'Title', with: 'A brand new post'
	  	click_button 'Create Post'

	  	expect(page).to have_content 'A brand new post'
	  	expect(current_path).to eq '/posts'
	  end

	end

end