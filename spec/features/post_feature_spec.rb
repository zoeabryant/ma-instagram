require 'rails_helper'

describe 'posts' do

	let(:post_title)	{ 'A brand new post' }
	let(:post_image)	{ Rails.root.join('spec/images/french_cat.gif') }

	context 'no posts' do
	  it 'shows a message' do
	  	visit '/posts'
	  	expect(page).to have_content 'No posts yet'
	  end
	end

	context 'with posts' do
		before do
			Post.create(title: post_title)
		end

		it 'displays a list of all posts' do
			visit '/posts'
			expect(page).to have_content post_title
		end
	end

	describe 'creating posts' do

		it 'adds the post from a form' do
			visit '/posts'
			click_link 'New Post'
			fill_in 'Title', with: post_title
			click_button 'Create Post'

			expect(page).to have_content post_title
			expect(current_path).to eq '/posts'
		end

		it 'can attach an image to a post' do
			visit '/posts/new'
			fill_in 'Title', with: post_title
			attach_file 'Picture', post_image
			click_button 'Create Post'

			expect(page).to have_css 'img.uploaded_pic'
		end

	end

end