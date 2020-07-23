Destination.destroy_all
Blogger.destroy_all
Post.destroy_all


30.times do 
  Destination.create({
    name: Faker::GameOfThrones.city,
    country: Faker::Address.country
  })
end


10.times do
  Blogger.create({
    name: Faker::Name.name,
    bio: Faker::Hipster.paragraph,
    age: (13..100).to_a.sample
  })

100.times do 
    Post.create({
      title: Faker::Hipster.sentence(3),
      content: Faker::Hipster.paragraphs(4),
      likes: 0,
      blogger: Blogger.all.sample,
      destination: Destination.all.sample
    })
  end
end
