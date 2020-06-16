class MailerConsumer < Racecar::Consumer
  subscribes_to 'mailer'

  def process(message)
    data = JSON.parse(message.value)
    MailerProcessors::Resolver.call(data['event']).call(data['email'], data)
  end
end
