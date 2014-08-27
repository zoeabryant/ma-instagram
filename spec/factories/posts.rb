FactoryGirl.define do
	factory :post do

		# association :tags, factory :tags

		title 'A brand new post'
		location 'London, UK'
		# picture Rails.root.join('spec/images/french_cat.gif')
		tags create(:tags)

	end
end