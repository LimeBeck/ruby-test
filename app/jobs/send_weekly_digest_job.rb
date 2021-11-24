class SendWeeklyDigestJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    users = User.where(send_digest_mode: 'WEEKLY')
    blogs = BlogPost.where(
      'created_at >= :start_date', {
        start_date: 1.week.ago.utc
      }
    ) # Blog posts for last week
    if blogs.count.positive?
      users.each do |user|
        DigestMailer.with(user: user, blog_posts: blogs).weekly_digest.deliver_now
      end
    else
      puts '#################################'
      puts 'No blog posts published last week'
      puts '#################################'
    end
  end
end
