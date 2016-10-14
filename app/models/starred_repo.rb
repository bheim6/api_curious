class StarredRepo
  def initialize(attrs)
    @attrs = attrs
  end

  def name
    attrs[:name]
  end

  def url
    attrs[:html_url]
  end

  private
    attr_reader :attrs
end
