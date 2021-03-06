# frozen_string_literal: true
class Course::SurveysController < Course::ComponentController
  load_and_authorize_resource :survey, through: :course, class: Course::Survey.name
  add_breadcrumb :index, :course_surveys_path

  def index
  end

  def create
    if @survey.save
      render partial: 'survey', locals: { survey: @survey }
    else
      render json: { errors: @survey.errors }, status: :bad_request
    end
  end

  private

  def survey_params
    params.require(:survey).
      permit(:title, :description, :base_exp, :start_at, :end_at)
  end
end
