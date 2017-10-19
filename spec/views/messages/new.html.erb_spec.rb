require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :conversation => nil,
      :content => "MyText",
      :from_profile_a => false
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[conversation_id]"

      assert_select "textarea[name=?]", "message[content]"

      assert_select "input[name=?]", "message[from_profile_a]"
    end
  end
end
