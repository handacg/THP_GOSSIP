require 'faker'
10.times do |i|
  new_city = City.create(name: Faker::Address.city, postal_code: Faker::Address.postcode)
  10.times do
    n = User.new(first_name:     Faker::Name.first_name, last_name:  Faker::Name.last_name, description:  Faker::VForVendetta.quote, email:  Faker::Internet.email, age: rand(78)+1)
    n.city= new_city
    n.save
    5.times do
      m = Gossip.new(title: Faker::Book.name, content: Faker::VForVendetta.quote, date: Time.now.getutc)
      m.user = n
      m.save
      3.times do
        l = Tag.create(title: "##{Faker::Hipster.word}")
        m.tags << l
        m.save
      end
    end
  end
end

pm = PrivateMessage.create(content: Faker::StrangerThings.quote, date: Time.now.getutc)
pm.sender = User.last
pm.recipients = User.first
pm.save