describe "project" do
  it "can be created" do
    visit projects_path
    click_link_or_button "Create Project"

    fill_in "Name", with: "Scrabble"
    click_link_or_button "Create"
    expect(page).to have_text("Scrabble")
    expect(page).to have_text("Backlog")
  end
end
