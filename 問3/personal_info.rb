# クラス定義
class PersonalInfo
  #メソッドでスコープ外でも使う変数を定義
  attr_accessor :id, :name, :address1, :address2, :address3, :address4, :address5, :birthday

  def initialize(row)
    @id = row ["id"]
    @name = row["name"]
    @address1 = row["address1"]
    @address2 = row["address2"]
    @address3 = row["address3"]
    @address4 = row["address4"]
    @address5 = row["address5"]
    @birthday = row["birthday"]
  end

  def address
    [@address1, @address2, @address3, @address4, @address5].compact.join
  end

  def age
    # Time-Timeで日数計算を行う。今日の日付から生年月日を引き、年間の日数で割る。その際小数点以下は不要なのでfloorメソッドで切り捨てる。@birthdayはTimeクラスではないためparseで変換
    age = ((Date.today- Date.parse(@birthday))/365).floor(0)
    age
  end

  # json形式で保存するためにインスタンスをハッシュ化
  def to_h
    {
      "id" => @id,
      "name" => @name,
      "address" => address,
      "birthday" =>@birthday,
      "age" => age
    }
  end
end