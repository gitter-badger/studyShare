class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]

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

  def destroy
    @curriculum = Curriculum.find(params[:id])

    if @curriculum.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @curriculum.destroy
    redirect_to curriculums_path
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:name)
  end
end
