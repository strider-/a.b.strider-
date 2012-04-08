# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating base account
User.create(
  firstname:"Michael",
  lastname:"Tighe",
  nickname:"strider-",
  email:"striderIIDX@gmail.com",
  birthday:"1980-04-03",
  password:"password",
  password_confirmation:"password"
  bio: "West Philadelphia born & raised, on the playground is where I spent most of my days."
)

#personal links
PersonalLink.create(title: "facebook", link: "https://www.facebook.com/strizzay", code: "f")
PersonalLink.create(title: "twitter", link: "http://twitter.com/striderIIDX", code: "t")
PersonalLink.create(title: "google+", link: "https://plus.google.com/105548546243887201256/about", code: "g+")
PersonalLink.create(title: "the nerdery", link: "http://nerdery.com/people#Ti", code: "n")
PersonalLink.create(title: "github", link: "https://github.com/strider-", code: "gh")
