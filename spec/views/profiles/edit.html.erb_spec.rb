require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :postcode => "MyString",
      :profile_photo_data => "MyText",
      :bio => "MyText",
      :contact_number => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[postcode]"

      assert_select "textarea[name=?]", "profile[profile_photo_data]"

      assert_select "textarea[name=?]", "profile[bio]"

      assert_select "input[name=?]", "profile[contact_number]"
    end
  end
end
