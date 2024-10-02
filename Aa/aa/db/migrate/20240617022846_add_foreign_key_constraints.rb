class AddForeignKeyConstraints < ActiveRecord::Migration[6.0]
  def change
    # Agregar ON DELETE CASCADE a participations
    remove_foreign_key :participations, :users
    add_foreign_key :participations, :users, on_delete: :cascade

    remove_foreign_key :participations, :events
    add_foreign_key :participations, :events, on_delete: :cascade

    # Agregar ON DELETE CASCADE a reviews
    remove_foreign_key :reviews, :users
    add_foreign_key :reviews, :users, on_delete: :cascade

    remove_foreign_key :reviews, :events
    add_foreign_key :reviews, :events, on_delete: :cascade

    # Agregar ON DELETE CASCADE a events
    remove_foreign_key :events, :users
    add_foreign_key :events, :users, on_delete: :cascade

    # Agregar ON DELETE CASCADE a messages
    remove_foreign_key :messages, :users
    add_foreign_key :messages, :users, on_delete: :cascade

  end
end
