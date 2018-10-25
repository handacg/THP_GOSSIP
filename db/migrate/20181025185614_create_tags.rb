class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end
    create_table :gossips_tags do |t|
      t.belongs_to :gossip, index: true
      t.belongs_to :tag, index: true
    end
  end
end
