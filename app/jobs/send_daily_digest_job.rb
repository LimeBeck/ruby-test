class SendDailyDigestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.where(send_digest_mode: 'DAILY')
    
    # Do something later
  end
end
