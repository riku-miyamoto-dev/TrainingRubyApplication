require "./User"
begin  
  User.new(age:42, name: "伊藤")  
  User.new(name: "田中", age:25)
  User.new(name: "佐藤", age:18)
  User.new(age:38, name: "谷崎")
  User.new(name: "武田", age:17)
rescue 
  puts "18歳未満のためエラー発生"
end
