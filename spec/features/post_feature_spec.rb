require 'rails_helper'

describe 'posts' do
	context 'no posts' do
	  it 'shows a message' do
	  	visit '/posts'
	  	expect(page).to have_content 'No posts yet'
	  end
	end
end