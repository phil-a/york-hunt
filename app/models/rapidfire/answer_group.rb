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
        user.microposts.create!(content: user.name + " posted an answer!")
    end
    
  end
end
