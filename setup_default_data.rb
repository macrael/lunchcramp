#!/usr/bin/env ruby

require 'mongo'

db = Mongo::Connection.new.db("lunchdb")

# Add group "SUI"
groups = db["groups"]
groups.remove
sui = { "name" => "sui" }
duke_id = groups.insert({"name" => "duke"})
sui_id = groups.insert(sui)
sui["_id"] = sui_id

# Add restruants "Willie's", "Thai Pepper", "In n out", "cookout", "Tacos"
restraunts = db["restraunts"]
restraunts.remove

willies = {"name" => "Willie's", "group_id" => sui["_id"] }
thai = {"name" => "Thai Pepper", "group_id" => sui["_id"] }
ininout = {"name" => "In n out", "group_id" => sui["_id"] }
cookout = {"name" => "Cookout", "group_id" => duke_id }
tacos = {"name" => "Tacos", "group_id" => sui["_id"] }

[willies, thai, ininout, cookout, tacos].each do |rest|
  rest["_id"] = restraunts.insert(rest)
end

# Add people "Chris", "MacRae", "Patrick", "Mike", "Kevin", "Carina"
people = db["people"]
people.remove

macrae = { "name" => "MacRae", "group_id" => sui["_id"]  }
chris = { "name" => "Chris", "group_id" => sui["_id"]  }
patrick = { "name" => "Patrick", "group_id" => sui["_id"]  }
mike = { "name" => "Mike", "group_id" => sui["_id"]  }
kevin = { "name" => "Kevin", "group_id" => sui["_id"]  }
carina = { "name" => "Carina", "group_id" => duke_id }

[macrae, chris, patrick, mike, kevin, carina].each do |person|
  person["_id"] = people.insert(person)
end

# Add votes
votes = db["votes"]
votes.remove

votes.insert({"restraunt_id" => willies["_id"], "person_id" => macrae["_id"] })