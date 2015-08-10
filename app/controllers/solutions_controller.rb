class SolutionsController < ApplicationController

    def new
        @solution = Solution.new
    end

    def create
        @solution = Solution.new(solution_params)
    end


    def solution_params
      params.require(:solution).permit(:question_id, :correct_answer_text)
    end
        
end
