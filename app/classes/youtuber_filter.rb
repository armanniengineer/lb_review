class YoutuberFilter
  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:title]
    scope.where_like(columns => phrases)
  end

end
