require 'active_support/all'

Time.zone = 'America/Chicago'

class Birthday
  WHEN_IS_MY_BIRTHDAY = Date.new(2022, 11, 28)

  def self.is_my_birthday?(me)
    me.tz.now.to_date == WHEN_IS_MY_BIRTHDAY
  end
end
