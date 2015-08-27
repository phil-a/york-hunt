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
        question_group = Rapidfire::QuestionGroup.find_by(id: (Rapidfire::AnswerGroup.find_by(id: self.id).question_group_id)).name
        answers_cnt = answers.count - 1
        correct_cnt = 0
        answers_text = []
        answers_text << "<br \>"
        for i in (0..answers_cnt)
        question_text = Rapidfire::Question.all.where(question_group_id: (Rapidfire::QuestionGroup.find_by(id: (Rapidfire::AnswerGroup.find_by(id: self.id).question_group_id)).id))[i].question_text
          answers_text << answers[i].correct? + " " + question_text + ("<br \>".to_s.html_safe)
          if answers[i].correct? == "\u2705"
            correct_cnt = correct_cnt + 1
          end
        end

        #Create Post
        if (correct_cnt == Rapidfire::Answer.where(answer_group_id: self.id).count) # correct answers
          user.microposts.create!(content: user.name + " posted all correct answers for " + question_group.to_s + random_correct_message + answers_text.join(" ").to_s.html_safe)
        else  #incorrect answers
          user.microposts.create!(content: user.name + " posted some incorrect answers for " + question_group.to_s + random_incorrect_message + answers_text.join(" ").to_s.html_safe)
        end
    end

    def random_incorrect_message
      incorrect = %w(You\ suck! Go\ back\ and\ try\ again. You\ needs\ some\ learning.)
      return incorrect[rand(0..incorrect.count-1)]
    end

    def random_correct_message
      correct = %w(Finally! Congratulations Good\ stuff.)
      return correct[rand(0..correct.count-1)]
    end
    
  end
end
