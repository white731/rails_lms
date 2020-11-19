class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new()
  end

  def create
    @course = Course.new (course_params)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to @courses
  end

  private

  def course_params
    params.require(:courses).permit(:name,:course_id)
  end

end
