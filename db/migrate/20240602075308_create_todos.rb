class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos, comment: 'Todo管理' do |t|
      t.string :title, null: false, comment: 'タイトル'
      t.boolean :completed, null: false, default: false, comment: '完了ステータス'

      t.timestamps
    end
  end
end
