def build_items
  project = Project.create(name: "The Greatest Pivot Ever!")

  project.items.create(title: "Design wireframe", description: "build wireframe for design and layout of site")
  project.items.create(title: "Establish schema", description: "determine relationships between models")
  project.items.create(title: "Authenticate user", description: "use bcrypt to authenticate user")
end

build_items
