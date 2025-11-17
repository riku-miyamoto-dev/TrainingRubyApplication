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


# ファイルパスを取得し、csvファイルを読み込む
file_data = File.read(File.join(__dir__,'..', 'personal_infomation.csv'))

# parseメソッドを使ってパースを行う。
csv_data = CSV.parse(file_data, headers:true,)
# mapメソッドを用いて配列にパースしたデータ構造をクラスで宣言する。csv_data.class => CSV::Tableなのでmapメソッドで１行ずつ分解され処理を行う。
users = csv_data.map do |row|
  renames_row = row.to_h.transform_keys do |h|
    RENAMES[h]
  end
# クラスのインスタンスを定義
  PersonalInfo.new(renames_row)
end

# jsonファイルを保存するためにnewnメソッドをw(書き込み)で使用,users.jsonという名のfileインスタンスの作成
data = File.new("users.json","w")
# pretty_generateでjson形式に変換, printで、newで開いたusers.jsonファイルに書き込み
data.print(JSON.pretty_generate(users.map(&:to_h)))
# newを使ったため〆る必要がある
data.close