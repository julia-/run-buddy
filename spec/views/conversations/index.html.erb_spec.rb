require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    assign(:conversations, [
      Conversation.create!(
        :profile_a => nil,
        :profile_b => nil
      ),
      Conversation.create!(
        :profile_a => nil,
        :profile_b => nil
      )
    ])
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
