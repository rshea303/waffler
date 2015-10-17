describe "user" do

  it "can come and see the index of projects" do
    visit projects_path
    expect(current_path).to eq(projects_path)
    expect(page).to have_text("Welcome to your Waffler")
  end

  it "clicks on a project and is taken to show page" do
    project1 = Project.create(name: "The Pivot")

    visit projects_path
    click_link_or_button "The Pivot"
    # save_and_open_page
    expect(current_path).to eq(project_path(id: project1.id))

    expect(page).to have_text("Backlog")
    expect(page).to have_text("Ready")
    expect(page).to have_text("In Progress")
    expect(page).to have_text("Done")
  end

end
