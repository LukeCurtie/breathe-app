# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Therapist.destroy_all

require "faker"


 5.times do
  therapist = Therapist.new(
    name: Faker::Name.name,
    address: [" Candos Vacoas Road, Quatre Bornes", "Ghoorah Lane,Long Mountain", "Rue Marianne,Mahebourg", "Pamplemousses", "Beau Bassin-Rose Hill"].sample, # Randomly select an address from the array

  )
  therapist.save!
 end



 Quote.destroy_all

 quotes = [
    "'A problem is a chance for you to do your best.' - Duke Ellington",
    " 'No guts, no story.' - Chris Brady",
    " 'No pressure, no diamonds.' - Thomas Carlyle",
    "'You can if you think you can.' - George Reeves",
    " My life is my message. - Mahatma Gandhi",
    "'Why fit in when you were born to stand out?' - Dr. Seuss",
    "'Positive thoughts lead to positive results.' - Maria V. Snyder"]


quotes_tomorrow = [
    "'The only way to do great work is to love what you do.' -Steve Jobs",
    "'Failure is the condiment that gives success its flavor.' -Truman Capote",
    "'Turn your wounds into wisdom.' - Oprah Winfrey"]

 quotes.each_with_index do | quote, index|
   Quote.create!(content: quote, publish_date: Date.today - index )
 end

puts "destroying moods."
Mood.destroy_all
puts "Destroying journal entries..."
JournalEntry.destroy_all
puts "Destroying user..."
User.destroy_all

puts "Creating user..."
sanji = User.new(name: "Sanji", email: "sanji@email.com",
password: "sanji123")
sanji.save!
puts "sanji created successfully."

puts "populating calendar"
(0..30).each do |i|
  mood = Mood.new(
    user: sanji,
    emotion: ["Happy", "Sad", "Angry", "Anxious", "Joyful", "Numb"].sample,
    date: Date.today - i
    )
  mood.save!
end
