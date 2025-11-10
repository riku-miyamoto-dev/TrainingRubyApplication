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
# personal_info_dataの例 クラスはCSV::Table 　データ"no" =>"1" ,"namae"=>"三井 碧透","denwa"=>"080-2422-3182"
personal_info_data = CSV.parse(csv_data, headers:true)

# mapメソッドで配列を生成する。その際にCSV::Rowをハッシュ化し、命名規則を１行ずつ変換する。
# personal_info_aryの例 処理後のクラスはary, rowのクラスはCSV::Row, row.to_hはハッシュ
personal_info_ary = personal_info_data.map do |row|
  row.to_h.transform_keys {|h|RENAMES[h]}
end

# # #each do で配列に対して名前のみを取り出す処理を行う
personal_info_ary.each do |personal_info|
  puts personal_info["name"]
end