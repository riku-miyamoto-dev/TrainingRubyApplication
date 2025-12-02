class PersonalInfo
  attr_accessor :id, :name, :prefecture, :city, :town, :street_address, :bulding, :birthday

  def initialize(row)
    @id = row ["id"]
    @name = row["name"]
    @prefecture = row["prefecture"]
    @city = row["city"]
    @town = row["town"]
    @street_address = row["street_address"]
    @bulding = row["bulding"]
    @birthday = row["birthday"]
  end

  def address
    [@prefecture, @city, @town, @street_address, @bulding].compact.join
  end

  def age
    # Data-Dataで日数計算を行う。今日の日付から生年月日を引き、年間の日数で割る。その際小数点以下は不要なのでfloorメソッドで切り捨てる。@birthdayはDataクラスではないためparseで変換
    age = ((Date.today - Date.parse(@birthday)) / 365).floor(0)
  end
end