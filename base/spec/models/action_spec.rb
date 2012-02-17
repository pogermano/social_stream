require 'spec_helper'

describe Action do
  it "should be created from Audience" do
    audience = Factory(:activity).audiences.first

    actor = audience.activity.receiver

    actor.action_objects.should include(audience.activity.direct_activity_object)
  end

  it "should be created from public audience" do
    audience = Factory(:public_activity).audiences.first

    actor = Anonymous.instance

    actor.action_objects.should include(audience.activity.direct_activity_object)
  end
end
