class HomeController < ApplicationController
  def index
  end
  def show
  	@friends = Friendship.where({friend_id: current_user.id, option: '2'}, {user_id: current_user.id, option: '2'})
  end
end
