class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

   validates :name, :bio, presence: true
   validates :name, uniqueness: true
   validates :bio, length: { minimum: 30 }
   validates :age, numericality: { minimum: 1 }

 
   #user post with like total 
    def likes
      arr_likes = self.posts.reduce(0) {|sum, post| sum + post.likes }    
    end

    #featured post 
    def featured_post 
       self.posts.max_by {|i| i.likes}
    end

   #user top 5 most written about destinations
    def top_destination
        sort = self.posts.sort_by &:destination
        uniq_only = sort.uniq(&:destination_id)
        @top_five = uniq_only[0...5]
    end

end
