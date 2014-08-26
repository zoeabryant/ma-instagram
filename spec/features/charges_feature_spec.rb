require 'rails_helper'

describe 'Paying' do

	let(:post_title)	{ 'A brand new post' }
	let(:post_image)	{ Rails.root.join('spec/images/french_cat.gif')}

	context 'paying process' do

		before do
			Post.create(title: post_title)
		end

		xit 'presents the option to pay for a picture' do
			visit '/posts'
			click_link 'Download A brand new post'
		end

	end

end