# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 ActiveRecord::Base.transaction do 
  User.delete_all
  user1 = User.create!(username: 'Jason')
  user2 = User.create!(username: 'Cindy')
  Artwork.delete_all
  art1 = Artwork.create!(title: 'P1', image_url: 'wwww.p1.img', artist_id: user1.id)
  art2 = Artwork.create!(title: 'P2', image_url: 'wwww.p2.img', artist_id: user2.id)
  ArtworkShare.delete_all
  as1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user2.id)
  as2 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: user1.id)
 end

