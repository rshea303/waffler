def create_project
  visit projects_path
  click_link_or_button "Create Project"
  fill_in "Name", with: "Scrabble"
  click_link_or_button "Create"
end
