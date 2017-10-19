require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :name => "MyString",
      :profile => nil,
      :skill_level => "MyString"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input[name=?]", "activity[name]"

      assert_select "input[name=?]", "activity[profile_id]"

      assert_select "input[name=?]", "activity[skill_level]"
    end
  end
end
