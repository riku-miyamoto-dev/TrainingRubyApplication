require "csv"
require "Time"

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
  # ゲッターというインスタンス変数をクラス定義外でも呼び出せるようにするものを設定
  attr_accessor :name, :address1, :address2, :address3, :address4, :address5, :birthday

  def initialize(row)
    @name = row["name"]
    @address1 = row["address1"]
    @address2 = row["address2"]
    @address3 = row["address3"]
    @address4 = row["address4"]
    @address5 = row["address5"]
    @birthday = row["birthday"]
  end

  def address
    "#{@address1}#{@address2}#{@address3}#{@address4}#{@address5}"
  end

  def age
    now_time = Time.now
    birth = Time.parse(@birthday)
    ages = ((now_time -birth)/(60*60*24*365)).floor(0)
    "#{ages}歳"
  end
end

#ファイルパスを取得し、csvファイルを読み込む
csv_data = File.read(File.join(__dir__,'..', 'personal_infomation.csv'))

#parseメソッドを使ってパースを行う。
personal_info_data = CSV.parse(csv_data, headers:true,)

#mapメソッドを用いて配列にパースしたデータ構造をクラスで宣言する
personal_info_ary = personal_info_data.map do |row|
  renames_row = row.to_h.transform_keys {|h|RENAMES[h]}
  PersonalInfo.new(renames_row)
end

#each do で配列に対して名前のみを取り出す処理を行う
personal_info_ary.each do |user|
  puts user.name
  puts user.address
  puts user.age
end