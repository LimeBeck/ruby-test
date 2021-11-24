# Preview all emails at http://localhost:3000/rails/mailers/digest_mailer
class DigestMailerPreview < ActionMailer::Preview
  def daily_digest
    DigestMailer.with(user: User.first, blog_posts: BlogPost.all).daily_digest
  end

  def weekly_digest
    DigestMailer.with(user: User.first, blog_posts: BlogPost.all).weekly_digest
  end
end
