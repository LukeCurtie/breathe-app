# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# JournalEntry.destroy_all
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
    "'A problem is a chance for you to do your best.' -Duke Ellington",
    " 'No guts, no story.' -Chris Brady",
    " 'No pressure, no diamonds.' -Thomas Carlyle",
    "'You can if you think you can.' -George Reeves",
   " My life is my message. -Mahatma Gandhi",
   "'Why fit in when you were born to stand out?' -Dr. Seuss",
   "'Positive thoughts lead to positive results.' -Maria V. Snyder"]


quotes_tomorrow = [
    "'The only way to do great work is to love what you do.' -Steve Jobs",
    "'Failure is the condiment that gives success its flavor.' -Truman Capote",
    "'Turn your wounds into wisdom.' - Oprah Winfrey"]

 quotes.each_with_index do | quote, index|
   Quote.create!(content: quote, publish_date: Date.today - index )
 end

 quotes_tomorrow.each_with_index do | quote, index|
  Quote.create!(content: quote, publish_date: Date.today + index + 1)
end
