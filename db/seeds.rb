# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'unirest'


response = Unirest.get "https://www.uiltexas.org/pml/pml.php?_=1589225057566"

data = response.body['pml']

data.each do |x|
    Music.create(
        instrument: x[1],
        title: x[2],
        composer: x[3],
        arranger: x[4],
        publisher: x[5],
        difficulty: x[6],
    )
end