module MailerProcessors
  class Resolver < Service
    attr_accessor :template_name

    def initialize(template_name)
      @template_name = template_name
    end

    def call
      case @template_name
      when 'best_of_twitter'
        BestOfTwitterProcessor
      else
        DefaultProcessor
      end
    end
  end
end
