#エラー名を出すためにStandardErrorを継承
class UnderageException < StandardError
  def initialize
    puts "18歳未満です"
  end
end