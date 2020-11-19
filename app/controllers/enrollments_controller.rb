class EnrollmentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @teachers = @course.enrollments.where(role: "Teacher")
    @tas = @course.enrollments.where(role: "TA")
    @students = @course.enrollments.where(role: "Student")
  end

  def new
   @course = Course.find(params[:course_id])
   # grab a list of users that are not enrolled in the course
   @users = User.all - @course.users
   @enrollment = Enrollment.new()

  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = @course.enrollments.create(enrollment_params)
    if @enrollment.save 
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @course.enrollments.find(params[:id]).destroy
    redirect_to course_enrollments_path(@course)
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id,:role)
  end
end
