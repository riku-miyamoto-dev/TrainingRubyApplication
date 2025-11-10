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
    # アドレスのみの配列を作成
    address_ary = [@address1, @address2, @address3, @address4, @address5]
    # 配列からcompactメソッドでnilを削除し、joinメソッドで配列を連結し文字列に返す
    address_ary.compact.join
  end

  def age
    # 年齢を計算するための現在時刻を取得
    now_time = Time.now
    # Time-Timeにして計算を可能にするため string => Time 変換をparseメソッドで行う 
    birth = Time.parse(@birthday)
    # 計算結果が秒数で出力されるため、年間の秒数で割る。年齢を求める際、小数点以下は不要なのでfloorメソッドで切り捨て
    age = ((now_time - birth)/(60*60*24*365)).floor(0)
    age
  end
end
