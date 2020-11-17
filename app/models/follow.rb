class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  belongs_to :follower,   polymorphic: true
  belongs_to :followable, polymorphic: true

  def block!
    self.update_attribute(:blocked, true)
  end

end
