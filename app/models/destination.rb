class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_five 
        sort = self.posts.sort_by &:created_at
        top_five = sort[0...5]
    end

    def featured_post
         self.posts.max_by {|i| i.likes}
    end 

    def average_age
        unique_blogger_age = self.bloggers.uniq.map {|blogger| blogger.age}
        average = unique_blogger_age.sum / unique_blogger_age.length
    end

end
