class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)

    if @email.save
      redirect_to emails_path, notice: "Email sent"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def email_params
      params.require(:email).permit(:subject, :body)
    end
end