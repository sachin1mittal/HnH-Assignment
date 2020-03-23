class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    render json: @student.attributes.merge(courses: @student.courses)
  end

  def index
    @students = Student.all
    render json: @students
  end
end
