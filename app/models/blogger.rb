class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}


    def total_likes
        total_likes = 0
        self.posts.each do |post|
            total_likes += post.likes
        end
        total_likes
    end

    def most_likes
        @most_liked_post = nil
        @most_likes = -1
        self.posts.each do |post|
            #byebug
            if post.likes > @most_likes
                @most_liked_post = post
            end
        end
        @most_liked_post
    end

end
