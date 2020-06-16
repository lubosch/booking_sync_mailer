# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NotificationTemplate.where(path: 'best_of_twitter_mailer/send_email').first_or_initialize.update!(
  body: '<h1>Look at these tweets:</h1 {% for tweet in data %} <p>{{ tweet.description | escape }}, read more here: {{ tweet.url }} {{ tweet.created_at | escape }}</p> {% endfor %}',
  locale: nil,
  handler: 'liquid',
  partial: false,
  format: 'html'
)
