class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
    @templates = Template.pluck(:name, :id)
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(email_params)

    if @email.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.email(subscriber, @email).deliver_now
      end
      redirect_to emails_path, notice: "Email sent"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def email_params
      params.require(:email).permit(:subject, :body, :template_id)
    end
end