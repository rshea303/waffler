require_relative "../support/project_creator"

describe "user" do

  it "creates a task that defaults to backlog" do
    create_project

    click_link_or_button "Add New Item"
    fill_in "Title", with: "Create Twitter OAuth"
    fill_in "Description", with: "Must Test feature"
    click_link_or_button "Create Item"

    expect(page).to have_text("Create Twitter OAuth")

  end

end
