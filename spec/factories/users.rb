FactoryGirl.define do
	factory :user do
		email 'zoe@test.com'
		password '123456789'
		password_confirmation '123456789'
	end
end