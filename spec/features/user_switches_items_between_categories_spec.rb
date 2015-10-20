require "rails_helper"
require_relative "../support/project_creator"

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

  it "can slide item from backlog to ready" do
      create_project

      click_on("Add New Item")
      fill_in "Title", with: "First item"
      fill_in "Description", with: "First item description"
      click_on("Create Item")

      click_on("Add New Item")
      fill_in "Title", with: "Second item"
      fill_in "Description", with: "Second item description"
      click_on("Create Item")

      within ("#backlog") do
        click_link("->", match: :first)
      end

      within ("#ready") do
        expect(page).to have_text("First item")
        expect(page).to have_text("First item description")
        expect(page).not_to have_text("Second item")
        expect(page).not_to have_text("Second item description")
      end
  end

  it "can slide item ready to backlog" do
      create_project

      click_on("Add New Item")
      fill_in "Title", with: "First item"
      fill_in "Description", with: "First item description"
      click_on("Create Item")

      click_on("Add New Item")
      fill_in "Title", with: "Second item"
      fill_in "Description", with: "Second item description"
      click_on("Create Item")

      within ("#backlog") do
        click_link("->", match: :first)
      end

      within ("#ready") do
        expect(page).to have_text("First item")
        expect(page).not_to have_text("Second item")

        click_link("<-", match: :first)
      end

      within ("#backlog") do
        expect(page).to have_text("First item")
        expect(page).to have_text("Second item")
      end
  end


end
