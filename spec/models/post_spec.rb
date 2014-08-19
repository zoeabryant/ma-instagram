require 'rails_helper'

RSpec.describe Post, :type => :model do

	describe ':tag_list=' do

		let(:post) { Post.create(title: 'Post with tags') }

		context 'no tags provided' do
			it 'doesn\'t give any tags to the post' do
				post.tag_list = ''
				expect(post.tags).to be_empty
			end
		end

		context '1 tag provided' do
			it 'gives that tag to our post' do
				post.tag_list = '#swag'
				expect(post.tags.first.text).to eq '#swag'
			end
		end

		context 'multiple tags provided' do
			it 'gives those tags to our post' do
				post.tag_list = '#swag, #yolo'
				expect(post.tags.count).to eq 2
			end
		end

		context 'with existing tags' do
			before { Tag.create(text: '#yolo') }

			it 'reuses them' do
				post.tag_list = '#swag, #yolo'

				expect(Tag.count).to eq 2
			end
		end

		context 'with duplicate tags' do
			it 'takes out the duplicate' do
				post.tag_list = '#swag, #yolo, #yolo'

				expect(Tag.count).to eq 2
			end
		end

	end

end
