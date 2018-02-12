class CurriculumsController < ApplicationController
  def index
    @curriculums = Curriculum.all
  end

  def new
    @curriculum = Curriculum.new
  end

  def create

    @curriculum = current_user.curriculums.new(curriculum_params)

    if @curriculum.save!
      redirect_to curriculums_path
    else
      render status: 500
    end
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  def edit
    @curriculum = Curriculum.find(params[:id])
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    @curriculum.update_attributes(curriculum_params)
    redirect_to curriculum_path(@curriculum)
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:name)
  end
end
