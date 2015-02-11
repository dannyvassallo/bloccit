module VotesHelper

  def vote_link_classes(post, direction)
    classes = "glyphicon glyphicon-chevron-#{direction}"
    if current_user.voted(post).try(:"#{direction}_vote?")
      classes << " voted"
    end
    classes
  end

end