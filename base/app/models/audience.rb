# Every {Activity} is shared with one or more {audiences Audience}.
#
# Each {Audience} is equivalent to a {Relation}, which defines the {actors Actor}
# that are assigned to that relation and the {permissions Permission} granted to
# that {Audience}
class Audience < ActiveRecord::Base
  attr_accessor :direct_activity_object

  belongs_to :activity
  belongs_to :relation

  after_create :create_actions

  private

  # Create the {Action actions} so {Actor actors} can access the direct_object of the {Activity}
  def create_actions
    return if direct_activity_object.blank? || direct_activity_object.acts_as_actor?

    direct_activity_object.action_actor_ids = relation.receiver_ids
  end
end
