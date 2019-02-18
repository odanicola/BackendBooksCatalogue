class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table "order", primary_key: "no", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
      t.string "nama"
      t.text "alamat"
      t.string "nohp"
      t.string "email"
      t.string "jumlah"
      t.timestamps
    end
  end
end
