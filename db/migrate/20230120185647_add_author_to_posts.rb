class AddAuthorToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author
  end
end
