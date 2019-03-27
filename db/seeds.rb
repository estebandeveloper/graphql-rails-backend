# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JSON.parse(File.read('db/cities.json')).each do |city|
  City.find_or_create_by(id: city['id'], name: city['name'], url: city['url'],
                         latitude: city['latitude'], url_name: city['url_name'],
                         longitude: city['longitude'])
end
dummy_bus_operators = ['Tur-Bus', 'Pullman', 'Condor']
dummy_prices = [3000, 3500, 4000, 4500, 6000]
travel_notify = TravelNotify.create(name: 'Vacaciones de Invierno',
                                    departure_date: Time.now + 1.days,
                                    departure_city_id: 9333,
                                    destination_city_id: 9277,
                                    price: 5000)

(Date.today..Date.today + 7.days).map do |date|
  2.times do
    TravelNotifyHistory.create(price: dummy_prices.sample,
                               klass_type: 0,
                               travel_notify_id: travel_notify.id,
                               departure_time: travel_notify.departure_date,
                               bus_operator_name: dummy_bus_operators.sample,
                               obtained_at: date)
  end
end
