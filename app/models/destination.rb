class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        self.posts.max_by {|p| p.likes}
    end

    def most_recent_posts
       self.posts.order("created_at desc").limit(5)
    end
end
