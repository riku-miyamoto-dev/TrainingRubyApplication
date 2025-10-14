require "csv"
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

# クラス定義
class PersonalInfo
  attr_reader:name

  def initialize(row)
    @id = row["id"]
    @name = row["name"]
    @ruby = row["rubi"]
    @sex = row["sex"]
    @tel = row["tel"]
    @mobile = row["mobile "]
    @mail = row["mail"]
    @zip = row["zip"]
    @address1 = row["address1"]
    @address2 = row["address2"]
    @address3 = row["address3"]
    @address4 = row["address4"]
    @address5 = row["address5"]
    @birthday = row["birthday"]

  end
end

#ファイルパスを取得し、csvファイルを読み込む
csv_data = File.read(File.join(__dir__, 'personal_infomation.csv'))

#parseメソッドを使ってパースを行う。その際にリネームを行う
personal_info_data = CSV.parse(csv_data, headers:true, header_converters: lambda{|h| RENAMES[h]})

#mapメソッドを用いて配列にパースしたデータ構造をハッシュに変換して保存
personal_info_array = personal_info_data.map{|row| PersonalInfo.new(row)}


#each do で配列に対して名前のみを取り出す処理を行う
personal_info_array.each do |personal_info|
  puts personal_info.name
end 

# 確認用
# p personal_info_data.class
# p personal_info_array.class
# p personal_info_array.first.class
# puts personal_info_array[2].name