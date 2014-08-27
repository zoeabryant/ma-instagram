class Post < ActiveRecord::Base

	belongs_to :user

	has_attached_file :picture,
		styles: { medium: "500x500#" },
		:storage => :s3,
		:s3_credentials => {
			:bucket => 'ma-instagram',
		    :access_key_id => Rails.application.secrets.s3_access_key_id,
		    :secret_access_key => Rails.application.secrets.s3_secret_access_key
		}

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	has_and_belongs_to_many :tags

	def tag_list
	end

	def tag_list=(some_tags)
		return if some_tags.empty?

		some_tags.split(', ').each do |tag|
			self.tags << Tag.find_or_create_by(text: tag)
		end
	end

end
