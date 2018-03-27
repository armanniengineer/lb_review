module ReviewsHelper
	def likers_of(review)
    votes = review.votes_for.up.by_type(User)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.user_name, youtuber_path(voter.user_name), class: 'user-name')
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def display_likes(review)
    votes = review.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 2
    count_likers(votes)
  end


  def liked_review(review)
    return 'glyphicon-heart' if current_user.voted_for? review
    'glyphicon-heart-empty'
  end

  private

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end

  def count_likers(votes)
  	vote_count = votes.sizevote_count.to_s + ' likes'
  end
end
