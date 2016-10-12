class HomeController < ApplicationController
  def index
    @user = current_user
    @user_info = GithubUser.all_info(@user)
    # @name = current_user.name
  end
end
