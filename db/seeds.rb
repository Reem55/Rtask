5.times do
    Form.create(
    	first_name: Faker::Name.name,
    	last_name: Faker::Name.name,
    	email: Faker::Internet.email,
    	subject: Faker::Job.position,
    	description: Faker::Lorem.paragraph
    	)
end