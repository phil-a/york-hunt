class Solution < ActiveRecord::Base
    #belongs_to :question_id
    #belongs_to :correct_answer_text
    attr_accessible :question_id, :correct_answer_text
    
    
end
