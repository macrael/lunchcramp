class LearnAction < Cramp::Action
  def start
    render "MAMAMA!"
    db = Mongo::Connection.new.db("lunchdb")
    
    puts db.inspect
    
    finish
  end
end
