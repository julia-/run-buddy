require 'rails_helper'

RSpec.describe "conversations/new", type: :view do
  before(:each) do
    assign(:conversation, Conversation.new(
      :profile_a => nil,
      :profile_b => nil
    ))
  end

  it "renders new conversation form" do
    render

    assert_select "form[action=?][method=?]", conversations_path, "post" do

      assert_select "input[name=?]", "conversation[profile_a_id]"

      assert_select "input[name=?]", "conversation[profile_b_id]"
    end
  end
end
