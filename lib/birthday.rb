require 'active_support/all'

Time.zone = 'America/Chicago'

class Birthday
  WHEN_IS_MY_BIRTHDAY = Time.zone.parse('2022-11-28T00:00:00')

  def self.is_my_birthday?(me)
    Time.now >= WHEN_IS_MY_BIRTHDAY &&
      Time.now < WHEN_IS_MY_BIRTHDAY + 1.day
  end
end
