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

restraunts.insert({"name" => "Willie's", "group_id" => sui["_id"] })
restraunts.insert({"name" => "Thai Pepper", "group_id" => sui["_id"] })
restraunts.insert({"name" => "In n out", "group_id" => sui["_id"] })
restraunts.insert({"name" => "Cookout", "group_id" => duke_id })
restraunts.insert({"name" => "Tacos", "group_id" => sui["_id"] })

# Add people "Chris", "MacRae", "Patrick", "Mike", "Kevin", "Carina"
people = db["people"]
people.remove

people.insert({ "name" => "MacRae", "group_id" => sui["_id"]  })
people.insert({ "name" => "Chris", "group_id" => sui["_id"]  })
people.insert({ "name" => "Patrick", "group_id" => sui["_id"]  })
people.insert({ "name" => "Mike", "group_id" => sui["_id"]  })
people.insert({ "name" => "Kevin", "group_id" => sui["_id"]  })
people.insert({ "name" => "Carina", "group_id" => duke_id })

