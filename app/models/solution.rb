class Solution < ActiveRecord::Base
    #belongs_to :question_id
    #belongs_to :correct_answer_text
    belongs_to :question, class_name: 'Rapidfire::Question'
    #attr_accessible :question_id, :correct_answer_text
    
    
end
