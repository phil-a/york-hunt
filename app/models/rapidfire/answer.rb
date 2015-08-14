module Rapidfire
  class Answer < ActiveRecord::Base
    belongs_to :question
    belongs_to :answer_group, inverse_of: :answers

    validates :question, :answer_group, presence: true
    validate  :verify_answer_text, :if => "question.present?"

    if Rails::VERSION::MAJOR == 3
      attr_accessible :question_id, :answer_group, :answer_text
    end

    def get_answer_group
        Rapidfire::AnswerGroup.where(id: self.answer_group_id).first
    end
    
    def get_user
        User.where(id: self.get_answer_group.user_id)
    end

    def get_solution
        Rapidfire::Question.where(id: (Rapidfire::Answer.where(id: self.id).first.question_id)).first.solution
    end
    
    def correct?
        if (self.answer_text == self.get_solution.correct_answer_text)
            return "\u2705"
        else
            return "\u274C"
        end
    end

    private
    def verify_answer_text
      question.validate_answer(self)
    end
  end
end
