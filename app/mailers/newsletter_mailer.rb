class NewsletterMailer < ApplicationMailer  
  def email(subscriber, email, template_id=1)
    @subscriber = subscriber
    @email = email

    mail to: @subscriber.email, subject: @email.subject do |format|
      format.html { render layout: custom_layout(template_id) }
    end
  end

  def custom_layout(template_id)
    template = Template.last
    name = template.name
    abs_path = Rails.root.join("app/views/layouts/#{name}.html.erb")

    # Layout HTML.
    # It could come from the DB, doesn't have to be hard coded.
    html = template.body.html_safe
    # html = <<~LAYOUT
    # <h1>Asta va fi din db, numele va fi tot din db </h1>
    # <%= yield %>
    # <p>asta tot din db</p>
    # LAYOUT

    # Create a new layout file
    File.write(abs_path, html)

    # Return the layout name
    name
  end
end
