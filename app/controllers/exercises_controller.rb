class ExercisesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_exercise, except: [ :index, :new, :create ]

	def index
	end

	def new
		@exercise = current_user.exercises.new
	end

	def create
		@exercise = current_user.exercises.new(params_exercise)

		if @exercise.save
			flash[:success] = "Exercise has been created"
			redirect_to [current_user, @exercise]
		else
			flash[:danger] = "Exercise could not be created"
			render "new"
		end
	end

	def show

	end

	private

	def params_exercise
		params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
	end

	def set_exercise
		@exercise = current_user.exercises.find(params[:id])
	end

end