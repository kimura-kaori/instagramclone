class PicturePostMailer < ApplicationMailer
  def picturepost_mail(picturepost)
    @picturepost = picturepost

    mail to: @picturepost.email, subject: "お問い合わせの確認メール"
  end
end
