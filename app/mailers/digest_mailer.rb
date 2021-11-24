class DigestMailer < ApplicationMailer
  def daily_digest
    @user = params[:user]
    @posts = params[:blog_posts]
    mail(to: @user.email, subject: t('mailer.daily.subject'))
  end

  def weekly_digest
    @user = params[:user]
    @posts = params[:blog_posts]
    mail(to: @user.email, subject: t('mailer.weekly.subject'))
  end
end
