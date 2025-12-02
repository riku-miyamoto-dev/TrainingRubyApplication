require "erb"
require "csv"
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

# csvファイルを読み込みCSVクラスのインスタンスを作成
file_data = File.read(File.join(__dir__, '..', 'personal_infomation.csv'))
csv_data = CSV.parse(file_data, headers:true)

# ヘッダー命名変更し、PersonalInfoクラスのインスタンスを作成
personal_info_array = csv_data.map do |row|
  renames_row = row.to_h.transform_keys do |h|
    RENAMES[h]
  end
  PersonalInfo.new(renames_row)
end


erb_data = ERB.new(File.read("table.erb"))
File.write("table.html", erb_data.result)