class DashboardController < ApplicationController
  def index
    @user_info = GithubUser.all_info(current_user)
  end
end
