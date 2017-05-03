current_page_cool_function

  <% if current_page?(root_path) %>
    <p>All Posts</p>
  <% elsif current_page?(about_path) %>
    <p>About</p>
  <% else %>
    <%= link_to "Back to All Posts", root_path %>
  <% end %>

in_routes
  get '/about', to: 'pages#about'

comment_create_with_post_id
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:id])
      @comment = @post.comments.create(params[:comment].permit(:name, :body))

      redirect_to post_path(@post)
    end
  end

show_comments_in_post
  <%= render @post.comments %>
  上下一樣
  <% @post.comments.each do |comment| %>
   <%= render(:partial => '/comments/comment' , :locals => {:comment => comment}) %>
   <% end %>


add_post_do_resources_comments
  resources :posts do
    resources :comments
  end

add_comment_reference_post_id
  $rails g model Comment name:string body:text post:references

if_new&edit_usesame_form_use_this
  <%= form_for @post do |f| %>
  <% end %>
not,this_only_for_create_#action
  <%= form_for :post, :url=> posts_path do |f| %>
  <% end %>

model_Validate
  class Post < ActiveRecord::Base
  	has_many :comments, dependent: :destroy
  	validates :title, presence: true, length: {minimum: 5}
  	validates :body,  presence: true
  end


google_font
  <%= stylesheet_link_tag 'application', 'http://fonts.googleapis.com/css?family=Raleway:400,700' %>


current_page

  <% if current_page?(root_path) %>
    <p>All Posts</p>
  <% elsif current_page?(about_path) %>
    <p>About</p>
  <% else %>
    <%= link_to "Back to All Posts", root_path %>
  <% end %>
