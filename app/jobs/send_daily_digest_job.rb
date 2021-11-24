class SendDailyDigestJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    users = User.where(send_digest_mode: 'DAILY')
    blogs = BlogPost.where(created_at: (Time.now - 1.days).all_day) # Blog posts for yesterday
    if blogs.count.positive?
      users.each do |user|
        DigestMailer.with(user: user, blog_posts: blogs).daily_digest.deliver_now
      end
    else
      puts '#################################'
      puts 'No blog posts published yesterday'
      puts '#################################'
    end
  end
end
