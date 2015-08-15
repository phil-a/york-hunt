module Rapidfire
  class AnswerGroup < ActiveRecord::Base
    belongs_to :question_group
    belongs_to :user, polymorphic: true
    has_many   :answers, inverse_of: :answer_group, autosave: true

    if Rails::VERSION::MAJOR == 3
      attr_accessible :question_group, :user
    end

    after_save do
        user = User.find_by(id: (self.user_id))
        answers = Rapidfire::Answer.where(answer_group_id: self.id)
        answers_cnt = answers.count - 1
        answers_text = []
        for i in (0..answers_cnt)
          answers_text << answers[i].answer_text + answers[i].correct?
        end
        user.microposts.create!(content: user.name + " posted an answer!" + answers_text.to_s)
    end
    
  end
end
