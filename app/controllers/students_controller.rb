class StudentsController < ApplicationController
    #GET /students
    def index
        students = Student.all 
        render json: students
    end

    #GET /students/:id
    def show
        students = Student.find_by(id: params[:id])
        if students
            render json: students, status: :ok
        else
            render json: { error: 'Student not found' }, status: :not_found
        end
    end

    #POST /students
    def create
        student = Student.create(student_params)
        render json: student, status: :created
    end

    #PATCH /students/:id
    def update
         student = Student.find_by(id: params[:id])
         student.update(student_params)
         render json: student
    end

    #DELETE /students/:id
    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.require(:student).permit(:name, :major, :age)
    end

end
