require "./UnderageException"
class User
  # クラス生成時年齢を判断するため
  def initialize(age:, name:)
    # 課題指定の年齢
    if age < 18
      # raiseは例外オブジェクトを受け取るためクラスを参照
      raise UnderageException
    else
      puts "インスタンスの作成に成功 => #{name}さん#{age}歳"
    end
  end
end
