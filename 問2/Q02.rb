require "csv"
require_relative "personal_info"

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
file_data = File.read(File.join(__dir__,'..', 'personal_infomation.csv'))

#parseメソッドを使ってパースを行う。
csv_data = CSV.parse(file_data, headers:true,)

#mapメソッドを用いて配列にパースしたデータ構造をクラスで宣言する。csv_data.class => CSV::Tableなのでmapメソッドで１行ずつ分解され処理を行う。
# rowの中身は<CSV::Row "no":"5000" "namae":"浜田 次男" "rubi":"ハマダ ツギオ" "seibetu":"男" "denwa":"019-880-9645" "keitai":nil "mairu":"Tsugio_Hamada@knrre.uihln.og" "yuubinbango":"028-0143" "jusho1":"岩手県" "jusho2":"花巻市" "jusho3":"東和町上浮田" "jusho4":"1-1-18" "jusho5":nil "tanjobi":"1941/11/23">
personal_info_ary = csv_data.map do |row|
  renames_row = row.to_h.transform_keys {|h|RENAMES[h]}
# クラスのインスタンスを定義
#renames_rowの中身{"id" => "5000", "name" => "浜田 次男", "ruby" => "ハマダ ツギオ", "sex" => "男", "tel" => "019-880-9645", "mobile" => nil, "mail" => "Tsugio_Hamada@knrre.uihln.og", "zip" => "028-0143", "address1" => "岩手県", "address2" => "花巻市", "address3" => "東和町上浮田", "address4" => "1-1-18", "address5" => nil, "birthday" => "1941/11/23"}
  PersonalInfo.new(renames_row)
#インスタンスの中身 <PersonalInfo:0x000000011cb4d6c0 @name="浜田 次男", @address1="岩手県", @address2="花巻市", @address3="東和町上浮田", @address4="1-1-18", @address5=nil, @birthday="1941/11/23">
end

# # each do で配列に対して名前のみを取り出す処理を行う
# personal_info_ary.each do |user|
#   puts user.name
#   puts user.address
#   puts user.age
# end