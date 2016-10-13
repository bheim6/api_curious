class GithubService
  # def self.legislators(filter)
  #   response = conn.get "/legislators", filter
  #   JSON.parse(response.body, symbolize_names: true)[:results]
  # end
  # def self.current_user
  #   current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end
  def initialize(current_user)
    @current_user = current_user
  end

  def conn
    Faraday.new(:url => "https://api.github.com") do |f|
      f.adapter  Faraday.default_adapter
      f.params[:access_token] = @current_user.token
    end
  end

  def user
    response = conn.get "/user"
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos
    response = conn.get "/user/repos"
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred
    response = conn.get "/user/starred"
    JSON.parse(response.body, symbolize_names: true)
  end
end
