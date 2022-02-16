require 'active_support/all'

class Birthday
  WHEN_IS_MY_BIRTHDAY = Time.parse('2022-11-28T00:00:00Z')

  def self.is_my_birthday?(me)
    return Time.now == WHEN_IS_MY_BIRTHDAY
  end
end
