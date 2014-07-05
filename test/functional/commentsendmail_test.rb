require 'test_helper'

class CommentsendmailTest < ActionMailer::TestCase
  test "sendmail" do
    mail = Commentsendmail.sendmail
    assert_equal "Sendmail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
