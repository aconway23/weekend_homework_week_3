require('pry')
require_relative('models/customer.rb')
require_relative('models/ticket.rb')
require_relative('models/film.rb')

Customer.delete_all()
Ticket.delete_all()
Film.delete_all() 

customer1 = Customer.new({ 'name' => 'Notorious Bob', 'funds' => 10 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Shady Sam', 'funds' => 15 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Infamous Tim', 'funds' => 20 })
customer3.save()

film1 = Film.new({ 'title' => 'Jurassic Park', 'price' => 10 })
film1.save()
film2 = Film.new({ 'title' => 'Casino Royale', 'price' => 10 })
film2.save()
film3 = Film.new({ 'title' => 'Alien', 'price' => 10 })
film3.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id })
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id })
ticket3.save()


binding.pry
nil
