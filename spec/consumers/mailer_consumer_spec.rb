require 'rails_helper'

describe MailerConsumer do
  subject { described_class.new.process(message) }
  let(:message) do
    double(
      'message',
      value: {
        event: 'best_of_twitter',
        email: 'john@wick.com',
        published_at: Time.zone.parse('2020/02/02'),
        data: [
          {
            url: 'google.com',
            description: 'Short description',
            created_at: '2020/02/02 15:13'
          },
          {
            url: 'google.me',
            description: 'Longer description',
            created_at: '2020/02/03 15:13'
          }
        ]
      }.to_json
    )
  end
  let!(:template) do
    NotificationTemplate.create!(
      path: 'best_of_twitter_mailer/send_email',
      body: '<h1>Look at these tweets:</h1 {% for tweet in data %} <p>{{ tweet.description | escape }}, read more here: {{ tweet.url }} {{ tweet.created_at | escape }}</p> {% endfor %}',
      locale: nil,
      handler: 'liquid',
      partial: false,
      format: 'html'
    )
  end

  it 'send an email to the email' do
    subject
    last_delivery = ActionMailer::Base.deliveries.last
    expect(last_delivery.body).to include('Short description', '2020/02/02 15:13', 'google.com', 'google.me', 'Longer description')
  end
end
