增加Sign Out Link

沒用searchkick
自己加search  model + controller + view
	movie model
	  def self.search(search)
		if search
		  where('title LIKE ? OR owner LIKE ?', "%#{search}%", "%#{search}%").order('created_at DESC')
		else
		  all.order('created_at DESC')
		end
	  end

加星星jquery
	jquery.raty.js


paperclip
	class AddAttachmentImageToMovies < ActiveRecord::Migration
	  def self.up
		change_table :movies do |t|
		  t.attachment :image
		end
	  end

	  def self.down
		remove_attachment :movies, :image
	  end
	end


model

	class User < ApplicationRecord
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
		     :recoverable, :rememberable, :trackable, :validatable
	  has_many :movies
	  has_many :reviews, dependent: :destroy
	end
