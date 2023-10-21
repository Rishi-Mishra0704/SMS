class TimetablesController < ApplicationController
    def index
      @time_tables = TimeTable.all
      render json: @time_tables
    end

    def show
        @time_table = TimeTable.find(params[:id])
        render json: @time_table
    end

    def destroy
        @time_table = TimeTable.find(params[:id])
        @time_table.destroy
        head :no_content
    end
end
  