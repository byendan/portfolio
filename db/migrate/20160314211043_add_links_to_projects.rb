class AddLinksToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github, :string
    add_column :projects, :site, :string
  end
end
