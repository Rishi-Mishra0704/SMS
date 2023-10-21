class ClassroomsController < ApplicationController
    def index
        @classrooms = Classroom.all
        render json: @classrooms
    end
end
