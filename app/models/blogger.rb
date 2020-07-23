class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true, presence: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}

    def total_likes
        self.posts.map {|p| p.likes}.sum
    end

    def featured_post
        self.posts.max_by {|p| p.likes}
    end

end
