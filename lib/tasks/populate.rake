def venue(name)
  Venue.create(:name => name)
end

def talks(venue, starts_at, ends_at, length=30.minutes)
  while starts_at < ends_at do
    venue.talks.create(:starts_at => starts_at, :ends_at => starts_at + length)
    starts_at = starts_at + length
  end
end

def topic(name, starts_at)
  Talk.find_all_by_starts_at(starts_at).each do |venue|
    venue.update_attributes(:topic => name)
  end
end

namespace :populate do
  desc "Populate the database with venues"
  task '2009' => :environment do
    date = Date.new(2009, 4, 18)

    slingapours = venue("Slingapour's")
    one_eyed_jacks = venue("One Eyed Jacks")
    gibson_showroom = venue("Gibson Showroom")

    talks(slingapours, date + 9.hours + 30.minutes, date + 13.hours)
    talks(slingapours, date + 13.hours, date + 14.hours, 1.hour)
    talks(slingapours, date + 14.hours, date + 16.hours)
    talks(slingapours, date + 16.hours, date + 18.hours, 10.minutes)

    [one_eyed_jacks, gibson_showroom].each do |venue|
      talks(venue, date + 10.hours, date + 13.hours)
      talks(venue, date + 13.hours, date + 14.hours, 1.hour)
      talks(venue, date + 14.hours, date + 18.hours)
    end

    topic("Registration", date + 9.hours + 30.minutes)
    topic("Lunch at The Globe", date + 13.hours)
  end
end
