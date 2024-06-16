require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "正常に作成されること" do
    todo = FactoryBot.build(:todo)
    expect(todo).to be_valid
  end

  it "タイトルがない場合は無効であること" do
    todo = FactoryBot.build(:todo, title: nil)
    expect(todo).to_not be_valid
  end

  it "タイトルが重複している場合も有効であること" do
    FactoryBot.create(:todo, title: "重複タイトル")
    todo = FactoryBot.build(:todo, title: "重複タイトル")
    expect(todo).to be_valid
  end

  it "デフォルトの未完了ステータスはfalseであること" do
    todo = FactoryBot.build(:todo, completed: nil)
    expect(todo).to be_valid
    expect(todo.completed).to be(false)
  end
end
