class PagesController < ApplicationController
  def feed

    @posts = Post.all
    #array of Users that are being followed
    @followed_users = []
    #array of Posts from Users that are being followed
    @followed_posts = []
    #full array of every user that has posted
    @post_users = []
    #full array of every user post
    @users_posts = []
    # this whole block isn't ideal, will need to refactor

    # populat user and post arrays from above
    @posts.each do |p|
      @post_users << p.user
      @users_posts << p
    end

    # check if any users that have posted are followed
    @users_posts.sort {|a,b| b.created_at <=> a.created_at }.each do |p|
      if current_user.follows?(p.user)
        @followed_posts << p
        @followed_users << p.user
      end
      if @followed_posts.any? && p.user == current_user
        @followed_posts << p
      end
    end



      #
      # @followed_users.each do |p|
      # @followed_posts << p
      # end



  end

  def empty_feed_check(followed_posts)
    if followed_posts.empty?
      puts "Hey #{current_user}! Doesn't look like you're following anybody. Let's find you some Meowers to follow!"
    end

  end

  def profile
  end

  def admin
  end

  def index
  end
end
