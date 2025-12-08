class User
  #エラー名を出すためにStandardErrorを継承
  class UnderageException < StandardError
  end

  # クラス生成時年齢を判断するため
  def initialize(age:, name:)
    begin
      # 課題指定の年齢
      if age < 18
        # raiseは例外オブジェクトを受け取るためクラスを参照
        raise UnderageException
      end
      puts "インスタンスの作成に成功 => #{name}さん#{age}歳"
    rescue
      puts "18歳未満のためエラー発生"
    end
  end
end
