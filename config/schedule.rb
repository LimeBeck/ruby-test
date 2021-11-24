# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 1.day, at: '7:00 am' do
  runner "SendDailyDigestJob.perform_later"
end

every :monday, at: '7:00 am' do
  runner "SendWeeklyDigestJob.perform_later"
end

# Learn more: http://github.com/javan/whenever
