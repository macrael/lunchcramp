class RestrauntAction < Cramp::Action
  
  def start    
    db = Mongo::Connection.new.db("lunchdb")
        
    restraunts = db["restraunts"]
    rests = []
    
    group_name_param = params[:group]
    if group_name_param
      group = db["groups"].find_one({"name" => group_name_param })
      rests = restraunts.find("group_id" => group["_id"])
    else
      puts "Someone is asking for all restruants without group"
      rests = restraunts.find()
    end
    
    rests.each do |rest|
      render rest["name"] + "\n"
    end
    
    finish
  end
  
end