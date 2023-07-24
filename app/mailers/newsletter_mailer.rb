class NewsletterMailer < ApplicationMailer  
  def email(subscriber, email)
    @subscriber = subscriber
    @email = email
    mail to: @subscriber.email, subject: @email.subject do |format|
      format.html { render layout: custom_layout }
    end
  end

  def custom_layout
    template = Template.last
    name = template.name
    abs_path = Rails.root.join("app/views/layouts/#{name}.html.erb")
    File.write(abs_path, template.body.html_safe)
    name
  end
end
