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

#ファイルパスを取得し、csvファイルを読み込む
csv_data = File.read(File.join(__dir__, 'personal_infomation.csv'))

#parseメソッドを使ってパースを行う。その際にリネームを行う
personal_info_data = CSV.parse(csv_data, headers:true, header_converters:  lambda{|h| RENAMES[h]})

#mapメソッドを用いて配列にパースしたデータ構造を保存
personal_info_array = personal_info_data.map(&:to_h)

#each do で配列に対して名前のみを取り出す処理を行う
personal_info_array.each do |personal_info|
  puts personal_info["name"]
end