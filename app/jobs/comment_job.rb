class CommentJob < ApplicationJob
  queue_as :default

  def notify_owner(comment)
    # @comments = Comment.select("comments.id").where("comments.created_at >= ? AND comments.created_at <= ?",
    #   Time.now.last_month.beginning_of_month,
    #   Time.now.last_month.end_of_month)

    CommentsMailer.notify_post_owner(comment).deliver_later
  end

end
