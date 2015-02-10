module VotesHelper

  def vote_link_classes(post, direction)
    "glyphicon glyphicon-chevron-#{direction} && current_user.voted(post).#{direction}_vote?) ? 'voted' : '' }"
  end

end