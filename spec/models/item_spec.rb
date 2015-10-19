require 'rails_helper'

RSpec.describe Item, type: :model do
  it "belongs to a category" do
    category = Category.create(name: "Backlog")
    category.items.create(title: "Paint door", description: "Paint the front door.")

    item = category.items.first

    expect(item.title).to eq("Paint door")
  end
end
