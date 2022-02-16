require 'active_support/all'

Time.zone = 'America/Chicago'

class Birthday
  WHEN_IS_MY_BIRTHDAY = '2022-11-28T00:00:00'

  def self.is_my_birthday?(me)
    Time.current >= local_birthday_begin(me.tz) &&
      Time.current < local_birthday_begin(me.tz) + 1.day
  end

  def self.local_birthday_begin(tz)
    tz.parse(WHEN_IS_MY_BIRTHDAY)
  end
end
