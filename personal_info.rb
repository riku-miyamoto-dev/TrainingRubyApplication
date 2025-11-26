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
    # 配列からcompactメソッドでnilを削除し、joinメソッドで配列を連結し文字列に返す
    [@address1, @address2, @address3, @address4, @address5].compact.join
  end

  def age
    # 年齢を計算するための現在時刻を取得
    today = Date.today
    # Time-Timeにして計算を可能にするため string => Time 変換をparseメソッドで行う 
    birthday = Date.parse(@birthday)
    # 計算結果が日数で出力されるため、年間の日数で割る。年齢を求める際、小数点以下は不要なのでfloorメソッドで切り捨て
    age = ((today - birthday)/365).floor(0)
    age
  end

  def prefecture
    @address1
  end
end
