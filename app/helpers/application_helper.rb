module ApplicationHelper
    
    # Returns full title on a per page basis
    def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
            base_title
        else
            "#{page_title} | #{base_title}"
        end    
    end    
    
    def number_of_people_who_also_answered_count option_id
        Survey::Answer.where(option_id: option_id).count
    end
end
