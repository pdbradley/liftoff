require 'rails_helper'

feature "Visitor can't access groups" do

  scenario "Visitor tries to visit groups" do
    visit groups_path
    expect(page).to have_content "Please sign in  to continue."
  end

end
