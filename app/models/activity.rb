class Activity
  def initialize(attrs)
    @attrs = attrs
  end

  def repo_name
    attrs[:repo][:name]
  end

  def repo_url
    attrs[:repo][:url]
  end

  def type
    attrs[:type]
  end

  def commit_message
    attrs[:payload][:commits].first[:message]
  end

  private
    attr_reader :attrs
end
