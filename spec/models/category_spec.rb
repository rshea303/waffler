require 'rails_helper'

describe "A category" do
  it "is valid with a name" do
    category = Category.new(name: "Name") 

    expect(category).to be_valid
  end

  it "is not valid without a name" do
    category = Category.new(name: nil) 

    expect(category).not_to be_valid
  end

  it "has many items" do
    category = Category.create(name: "New Category")

    category.items.create(title: "Item1", description: "Item1 description")
    category.items.create(title: "Item2", description: "Item2 description")
    category.items.create(title: "Item3", description: "Item3 description")

    expect(category.items.count).to eq(3)
    expect(category.items.first.title).to eq("Item1")
    expect(category.items[1].title).to eq("Item2")
    expect(category.items[2].title).to eq("Item3")
  end

end
