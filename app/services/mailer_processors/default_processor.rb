module MailerProcessors
  class DefaultProcessor < Service
    attr_accessor :email, :data

    TEMPLATE_PATH = 'default_mailer/send_email'.freeze

    def initialize(email, data)
      @email = email
      @data = data
    end

    def call
      DefaultMailer.send_email(email, template, data).deliver_now
    end

    protected

    def template
      @template ||= NotificationTemplate.find_by(path: TEMPLATE_PATH)
    end
  end
end
