require 'byebug'

class Post::Create < Clomp::Operation
  track :new_post_instance
  
  track :validation_of_post do |options|
    options[:notice] = 'Your post is not valid'
  end
  
  track :persist_post
  
  track :notify_success
  
  def new_post_instance(options)
    options[:post] = Post.new
  end
  
  def validation_of_post(options, post:, **)
    post.assign_attributes(options[:mutable_data])
    
    if options[:mutable_data].present?
      post.valid?
    else
      raise 'Data not mutable'
    end
  end
  
  def persist_post(options, post:, **)
    post.save
  end
  
  def notify_success(options, post:, **)
    options[:notice] = 'Congratulations! You have successfully created a new post!'
  end
end