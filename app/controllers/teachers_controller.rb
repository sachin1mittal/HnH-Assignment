class TeachersController < ApplicationController

  def create
    @teacher = Teacher.create!(teacher_params)
    @teacher.save!
    render json: @teacher
  end

  def destroy
    Teacher.find(params[:id]).destroy!
    render json: {}
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :education)
  end
end
