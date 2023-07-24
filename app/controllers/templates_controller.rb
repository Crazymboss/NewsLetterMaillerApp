class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def show
    @template = Template.find(params[:id])
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to templates_path, notice: "Template created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def template_params
      params.require(:template).permit(:name, :body)
    end
end