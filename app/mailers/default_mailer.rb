class DefaultMailer < ApplicationMailer
  def send_email(email, template, data)
    @template_body = template.render(data)
    mail(to: email, subject: 'Default email')
  end
end
