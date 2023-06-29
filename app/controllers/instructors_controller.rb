class InstructorsController < ApplicationController

    #GET/instructos
    def index
        instructors = Instructor.all 
        render json: instructors
    end

    #GET/instuctors/:id
    def show
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            render json: instructor, status: :ok
        else
            render json: { error: 'Instructor not found' }, status: :not_found
        end
    end
end
