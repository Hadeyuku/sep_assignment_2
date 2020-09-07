class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
	t.references :user, foreign_key: true
	t.references :follow, foreign_key: { to_table: :users }
#follow_idの参照先のテーブルはusersテーブルにしてあげたいので、{to_table: :users}としてあげてます。
#foreign_key: trueにすると存在しないfollowsテーブルを参照してしまうからです。
	t.timestamps

	t.index [:user_id, :follow_id], unique: true
#t.index [:user_id, :follow_id], unique: true は、 user_id と follow_id のペアで重複するものが保存されないようにするデータベースの設定です！
	t.timestamps
    end
  end
end
