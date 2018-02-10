require 'byebug'

class Post::Create < Clomp::Operation
  track :new_post_instance
  
  track :validation_of_post
  
  failure :set_errors
  
  track :persist_post
  
  track :notify_success
  
  def new_post_instance(options)
    options[:post] = Post.new
  end
  
  def validation_of_post(options, params:, post:, **)
    post.assign_attributes(params)
    
    if params.present?
      post.valid?
    else
      post.valid?
    end
  end
  
  def set_errors(options, post:, **)
    options[:errors] = post.errors.full_messages
  end
  
  def persist_post(options, post:, **)
    post.save
  end
  
  def notify_success(options, post:, **)
    options[:notice] = 'Congratulations! You have successfully created a new post!'
  end
end