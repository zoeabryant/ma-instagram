require 'rails_helper'

describe 'Users' do

	context 'Not Logged in' do

		it 'allows viewers to sign up' do
			visit '/posts'
			expect(page).to have_content 'Sign Up'
		end

		it 'does not allow a user to post unless signed in' do
			visit '/posts'
			click_link 'New Post'
			expect(current_path).to eq new_user_session_path
		end

	end

	context 'Signing up' do

		it 'signs a user up' do
			visit '/posts'
			click_link 'Sign Up'

			fill_in 'Email', with: 'test@example.com'
			fill_in 'Password', with: 'securepassword20'
			fill_in 'Password confirmation', with: 'securepassword20'

			click_button 'Sign up'
			expect(page).to have_content 'Welcome test@example.com!'
		end

	end

	context 'Signing in' do
		it 'users can sign in' do
			zoe = create(:user)
			sign_in(zoe)

			expect(page).to have_content "Welcome #{zoe.email}!"
		end
	end

	context 'Signing out' do
		it 'allows a user to sign out' do
			zoe = create(:user)
			sign_in(zoe)

			click_link 'Sign Out'

			expect(page).not_to have_content "Welcome #{zoe.email}!"
		end
	end

end