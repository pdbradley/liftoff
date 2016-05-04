require 'rails_helper'

feature 'User manages groups' do

  scenario "User creates a group" do
    user = create(:user)
    visit groups_path(as: user)
    click_link "Add Group"
    fill_in "Name", with: "Group 1"
    click_button "Create Group"

    expect(Group.count).to eq 1
    expect(page).to have_content "Group was successfully created."
  end

  scenario "User edits a group name" do
    user = create(:user)
    group = create(:group, user: user, name: "Somegroup")
    visit groups_path(as: user)
    click_link "Somegroup"
    fill_in "Name", with: "Another Group"
    click_button "Update Group"

    expect(group.reload.name).to eq "Another Group"
  end
end
