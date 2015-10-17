describe "user" do
  it "can view items in respective categories" do
    project1 = Project.create(name: "Backlog project")
    item1 = Item.create(title: "buy icecream",
                        description: "nonsense",
                        category_id: 1,
                        project_id: project1.id)

    

  end

end
