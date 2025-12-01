require "csv"
require "json"
require "./personal_info"
RENAMES = {
  'no' => 'id',
  'namae' => 'name',
  'rubi' => 'ruby',
  'seibetu' => 'sex',
  'denwa' => 'tel',  
  'keitai' => 'mobile',
  'mairu' => 'mail',
  'yuubinbango' => 'zip',
  'jusho1' => 'address1',
  'jusho2' => 'address2',
  'jusho3' => 'address3',
  'jusho4' => 'address4',
  'jusho5' => 'address5',
  'tanjobi' => 'birthday',
}


file_data = File.read(File.join(__dir__,'..', 'personal_infomation.csv'))
csv_data = CSV.parse(file_data, headers:true,)
users = csv_data.map do |row|
  renames_row = row.to_h.transform_keys do |h|
    RENAMES[h]
  end
  PersonalInfo.new(renames_row)
end

# jsonファイルを保存するためにnewnメソッドをw(書き込み)で使用
data = File.new("users.json","w")
data.print(JSON.pretty_generate(users.map{|h|h.to_h}))
# newを使ったため閉じる
data.close