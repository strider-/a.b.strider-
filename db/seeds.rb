# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating base account
me = User.create(
  firstname:"Michael",
  lastname:"Tighe",
  nickname:"strider-",
  email:"striderIIDX@gmail.com",
  birthday:"1980-04-03",
  password:"ragnarok",
  password_confirmation:"ragnarok"
)

# dummy posts
article_one = me.articles.create(
  title: "Test Post", 
  content: "Oh yeah"
)
article_one.tags.create(
  value: "Test"
)

article_two = me.articles.create(
  title: "Another Test Post", 
  content: "You'd think I'd get tired of reinventing the wheel but I guess not!"
)
article_two.tags.create(
  value: "Another"
)
article_two.tags.create(
  value: "Test"
)

#personal links
PersonalLink.create(title: "facebook", link: "https://www.facebook.com/strizzay", code: "f")
PersonalLink.create(title: "twitter", link: "http://twitter.com/striderIIDX", code: "t")
PersonalLink.create(title: "google+", link: "https://plus.google.com/105548546243887201256/about", code: "g+")
PersonalLink.create(title: "the nerdery", link: "http://nerdery.com/people#Ti", code: "n")
PersonalLink.create(title: "github", link: "https://github.com/strider-", code: "gh")
