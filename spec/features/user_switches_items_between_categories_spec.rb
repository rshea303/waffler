describe "user" do
  it "can view items in respective categories" do
    project1 = Project.create(name: "Backlog project")
    item1 = Item.create(title: "buy icecream",
                        description: "nonsense",
                        category_id: 1,
                        project_id: project1.id)

    item2 = Item.create(title: "buy horse",
                        description: "ride it",
                        category_id: 2,
                        project_id: project1.id)

    visit project_path(project1)
    within("#backlog") do
      expect(page).to have_text("buy icecream")
      expect(page).not_to have_text("buy horse")
    end
    within("#ready") do
      expect(page).to have_text("buy horse")
      expect(page).not_to have_text("buy icecream")
    end



  end

end
