class CurriculumsController < ApplicationController
  def index
    @curriculums = Curriculum.all
  end

  def new
    @curriculum = Curriculum.new
  end
end
