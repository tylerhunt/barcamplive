def venue(name, sponsor=nil)
  Venue.find_or_create_by_name(name).tap do |venue|
    venue.update_attributes(:sponsor => sponsor)
  end
end

def talks(venue, starts_at, ends_at, length=25.minutes, interval=30.minutes)
  while starts_at < ends_at do
    venue.talks.create(:starts_at => starts_at, :ends_at => starts_at + length)
    starts_at = starts_at + interval
  end
end

def topic(name, starts_at)
  Talk.find_all_by_starts_at(starts_at.in_time_zone).each do |talk|
    talk.update_attributes(:topic => name)
  end
end

namespace :populate do
  desc "Populate the database with the venues and talks for 2009"
  task '2009' => :environment do
    date = Date.new(2009, 4, 18)

    slingapours = venue('Slingapour\'s')
    one_eyed_jacks = venue('One Eyed Jack\'s')
    gibson_showroom = venue('Gibson Showroom')

    talks(slingapours, date + 9.hours + 30.minutes, date + 13.hours)
    talks(slingapours, date + 13.hours, date + 14.hours, 55.minutes)
    talks(slingapours, date + 14.hours, date + 16.hours)
    talks(slingapours, date + 16.hours, date + 18.hours, 10.minutes)

    [one_eyed_jacks, gibson_showroom].each do |venue|
      talks(venue, date + 10.hours, date + 13.hours)
      talks(venue, date + 13.hours, date + 14.hours, 55.minutes)
      talks(venue, date + 14.hours, date + 18.hours)
    end

    topic('Registration', date + 9.hours + 30.minutes)
    topic('Lunch at The Globe', date + 13.hours)
  end

  desc "Populate the database with the venues and talks for 2010"
  task '2010' => :environment do
    date = Date.new(2010, 4, 3)

    venues = [
      slingapours = venue('Slingapour\'s', 'Envy Labs'),
      one_eyed_jacks = venue('One Eyed Jack\'s', 'Voxeo'),
      gibson_showroom = venue('Gibson Showroom', 'Cloudspace'),
    ]

    venues.each do |venue|
      talks(venue, date + 10.hours, date + 13.hours)
      talks(venue, date + 13.hours, date + 14.hours, 55.minutes, 60.minutes)
      talks(venue, date + 14.hours, date + 18.hours)
    end

    talks(slingapours, date + 9.hours + 30.minutes, date + 10.hours)
    talks(slingapours, date + 18.hours, date + 19.hours, 60.minutes, 60.minutes)

    topic('Registration', date + 9.hours + 30.minutes)
    topic('Lunch at The Globe', date + 13.hours)
    topic('After Party', date + 18.hours)
  end
end
