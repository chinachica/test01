# coding: utf-8

class Commentsendmail < ActionMailer::Base
  default from: "chinatsu.practice@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.commentsendmail.sendmail.subject
  #
  def sendmail(comment)
    @comment = comment

    mail(:to => "chinatsu172@msn.com",
    :subject => 'コメントが追加されました')
  end
end
