class String

  # エラー文言
  UNSUPPORTED_ERROR = '対応していません'
  PALINDROME_ERROR = '回文には出来ません'

  def to_kaibun
    # 小文字を大文字にする
    self.upcase!

    # N, O, * 以外の文字があった場合エラーを出す
    return UNSUPPORTED_ERROR if self.match(/[^NO\*]/)

    # 文字数の半分を変数に入れる
    half_number = self.length.div(2)

    # 文字数が奇数でなおかつ中心の文字が「*」だった場合エラーを出す
    return UNSUPPORTED_ERROR if (self.length.odd?) && (self[half_number] == '*')

    # * がある場合、回文に変換する処理
    if self.index('*')
      # * がなくなるまで繰り返す
      while (asterisk_number = self.index('*')) != nil do
        # * に何の文字が入るか調べる
        asterisk_string = self.reverse[self.index('*')]

        # もし回文に入る文字が * の場合はエラーを出す
        return UNSUPPORTED_ERROR if asterisk_string == '*'

        # * を削除
        self.slice!(asterisk_number)

        # * にあたる文字を挿入
        self.insert(asterisk_number, asterisk_string)
      end
    end
    palindrome = self

    return PALINDROME_ERROR if palindrome != palindrome.reverse
    palindrome
  end
end
