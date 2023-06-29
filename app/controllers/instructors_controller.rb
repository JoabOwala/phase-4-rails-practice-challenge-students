class InstructorsController < ApplicationController

    #GET /instructos
    def index
        instructors = Instructor.all 
        render json: instructors
    end

    #GET /instuctors/:id
    def show
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            render json: instructor, status: :ok
        else
            render json: { error: 'Instructor not found' }, status: :not_found
        end
    end

    #POST /instuctors
    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: :created
    end

    #PATCH /instructors/:id
    def update
         instructor = Instructor.find_by(id: params[:id])
         instructor.update(instructor_params)
         render json: instructor
    end

    #DELETE /instructors/:id
    def destroy
        instructor = Instructor.find_by(id: params[:id])
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

end
