require 'rails_helper'

feature 'User manages groups' do

  scenario "User creates a group" do
    user = create(:user)
    visit groups_path(as: user)
    click_link "New Group"
    fill_in "Name", with: "Group 1"
    click_button "Create Group"

  end
end
