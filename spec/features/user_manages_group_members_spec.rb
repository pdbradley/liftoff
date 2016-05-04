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
    group = create(:group, user: user)
    visit group_members_path(group_id: group.id, as: user)
    click_link "Add Member"

    fill_form(:member, attributes_for(:member))
    click_button "Create Member"

    member = Member.first
    expect(page).to have_content member.first_name
    expect(page).to have_content member.last_name
    expect(page).to have_content member.phone_number
  end

  scenario "User edits a group member" do
    user = create(:user)
    group = create(:group, user: user)
    member = create(:member, group: group)
    visit group_members_path(group_id: group.id, as: user)

    click_link "Edit"
    fill_form(:member, attributes_for(:member, first_name: "Sally"))
    click_button "Update Member"

    expect(page).to have_content "updated"
    expect(page).to have_content "Sally"
  end

  scenario "User deletes a group member" do
    user = create(:user)
    group = create(:group, user: user)
    member = create(:member, group: group)
    visit group_members_path(group_id: group.id, as: user)
    click_link "Delete"

    expect(Member.count).to eq 0
  end

end
