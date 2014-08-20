# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Tag.destroy_all

10.times do |n|
	tags = %w(#london #pretty #art #hipster #tbt #lovemybff).sample(2).join(', ')
	name = %w(Arty London Pretty Wow Cute Me Totally).sample(2).join(' ')
	Post.create(title: "#{name}", tag_list: tags, picture: File.new(Rails.root.join "spec/images/example_#{n}.jpg"))
end