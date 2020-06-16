module MailerProcessors
  class BestOfTwitterProcessor < DefaultProcessor
    TEMPLATE_PATH = 'best_of_twitter_mailer/send_email'.freeze

    def call
      BestOfTwitterMailer.send_email(email, template, data).deliver_now
    end

    protected

    def template
      @template ||= NotificationTemplate.find_by(path: TEMPLATE_PATH)
    end
  end
end
