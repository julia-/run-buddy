require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :name => "MyString",
      :profile => nil,
      :skill_level => "MyString"
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input[name=?]", "activity[name]"

      assert_select "input[name=?]", "activity[profile_id]"

      assert_select "input[name=?]", "activity[skill_level]"
    end
  end
end
