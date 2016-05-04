require 'rails_helper'

feature 'User manages members' do

  scenario "User views group members" do
    user = create(:user)
    group = create(:group, name: "Somegroup", user: user)
    create(:member, first_name: "Phil", group: group)
    visit group_members_path(group_id: group.id, as: user)

    expect(page).to have_content "Somegroup"
    expect(page).to have_content "Phil"
  end

  scenario "User adds a group member" do
    user = create(:user)
    group = create(:group, name: "Somegroup", user: user)
    visit group_members_path(group_id: group.id, as: user)
    click_link "Add Member"
    fill_in "First name", with: "Jimmy"
    fill_in "Last name", with: "Miller"
    click_button "Create Member"

  end

end
