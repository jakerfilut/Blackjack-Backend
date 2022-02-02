class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :bankroll, default: 10000
      t.integer :games_played, default: 0
      t.integer :current_shoe_hand, default: 0
      t.string :perfect_strategy_correct, default: 0
      t.string :count_correct, default: 0
      t.string :bet_spread_correct, default: 0

      t.timestamps
    end
  end
end
