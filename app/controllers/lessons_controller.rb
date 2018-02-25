class LessonsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

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

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update_attributes lesson_params
    redirect_to curriculum_lesson_path(@lesson,
                                       curriculum_id: @lesson.curriculum.id)
  end

  def destroy
    @lesson = Lesson.find(params[:id])

    if @lesson.curriculum.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @lesson.destroy
    redirect_to curriculum_path(@lesson.curriculum)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description, :link)
  end
end
