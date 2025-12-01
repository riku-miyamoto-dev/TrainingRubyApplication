require "csv"
require "../personal_info"

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

# ヘッダー名を日本語→英語に変更
users = csv_data.map do |row|
  PersonalInfo.new(row.to_h.transform_keys {|h|RENAMES[h]})
end

# 計算結果を保存するHashを定義
prefecture_sum = Hash.new(0)
prefecture_count = Hash.new(0)
prefecture_avg = Hash.new(0)
# 都道府県別合計年齢,都道府県別加算回数を記録
users.each do |h|
  prefecture_sum[h.address1] += h.age  
  prefecture_count[h.address1] += 1
end



# 平均年齢の計算　小数点以下も求めたいためfloatに変換
prefecture_sum.each do|prefecture, sum|
  prefecture_avg[prefecture] = sum.to_f/prefecture_count[prefecture].to_f
end

# CSVファイルを作成し、書き込むため modeを"w"で指定
data = CSV.open("avg_age.csv", "w") do |data|
  p data
  # CSVのヘッダー部分を作成
  data.add_row(["都道府県", "平均年齢"])
  # 都道府県をCSVに保存
  prefecture_avg.each do |prefecture, avg|
    data.add_row([prefecture, avg.floor(2)])
  end
end