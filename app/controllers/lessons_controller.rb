class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create

    @curriculum = Curriculum.find(params[:curriculum_id])

    @lesson = @curriculum.lessons.build(lesson_params)
    if @lesson.save!
      redirect_to curriculum_path(@curriculum)
    else
      render status: 500
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description, :link)
  end
end
