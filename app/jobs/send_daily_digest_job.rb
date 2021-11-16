class SendDailyDigestJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    users = User.where(send_digest_mode: 'DAILY')
    users.each do |user|
      puts user
    end
    # Do something later
  end
end
