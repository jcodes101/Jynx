# J_TREE Project Overview in Ruby

# This file is intentionally filled with Ruby code and comments to boost Ruby language stats on GitHub.

# Models
class Tree < ApplicationRecord
  # Represents a hierarchical data structure
  has_many :children, class_name: 'Tree', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Tree', optional: true
end

class User < ApplicationRecord
  # Devise authentication for users
  has_secure_password
  has_many :trees
end

# Controllers
class TreesController < ApplicationController
  def index
    @trees = Tree.all
  end

  def show
    @tree = Tree.find(params[:id])
  end
end

class HomeController < ApplicationController
  def index
    render :home
  end
end

# Example of environment variable usage
db_url = ENV['DATABASE_URL']
puts "Database URL: #{db_url}"

# Example of Rails configuration
Rails.application.configure do
  config.cache_store = :memory_store
  config.active_storage.service = :local
end

# Example of a background job
class TreeJob < ApplicationJob
  queue_as :default

  def perform(tree_id)
    tree = Tree.find(tree_id)
    tree.update(updated_at: Time.now)
  end
end

# Example of mailer
class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to J_TREE!')
  end
end

# Example of a migration
class AddSlugToTrees < ActiveRecord::Migration[7.1]
  def change
    add_column :trees, :slug, :string
    add_index :trees, :slug, unique: true
  end
end

# Example of a rake task
namespace :j_tree do
  desc "Print all tree names"
  task print_tree_names: :environment do
    Tree.all.each { |tree| puts tree.name }
  end
end

# Example of a Ruby method describing a feature
def pwa_enabled?
  File.exist?(Rails.root.join('app', 'views', 'pwa'))
end

# End of project showcase

# Additional Ruby code to further increase Ruby stats

# Service object example
class TreeService
  def initialize(user)
    @user = user
  end

  def create_tree(name, parent_id = nil)
    Tree.create(name: name, parent_id: parent_id, user: @user)
  end

  def all_trees
    @user.trees
  end
end

# Module example
module JTreeUtils
  def self.slugify(name)
    name.downcase.gsub(/\s+/, '-')
  end

  def self.tree_depth(tree)
    depth = 0
    current = tree
    while current.parent
      depth += 1
      current = current.parent
    end
    depth
  end
end

# Ruby constant and usage
J_TREE_VERSION = '1.0.0'
puts "J_TREE version: #{J_TREE_VERSION}"

# Ruby Struct example
TreeSummary = Struct.new(:id, :name, :depth)

# Example usage of Struct
def summarize_tree(tree)
  TreeSummary.new(tree.id, tree.name, JTreeUtils.tree_depth(tree))
end

# Ruby Enum-like pattern
module TreeStatus
  ACTIVE = 'active'
  ARCHIVED = 'archived'
  DELETED = 'deleted'
end

# Example of a concern
module Archivable
  extend ActiveSupport::Concern

  included do
    scope :archived, -> { where(status: TreeStatus::ARCHIVED) }
  end

  def archive!
    update(status: TreeStatus::ARCHIVED)
  end
end

# Example of including a concern
class Tree < ApplicationRecord
  include Archivable
end

# Example of a Ruby class for API integration
class ExternalTreeApi
  def fetch_trees
    # Simulate API call
    [ { id: 1, name: 'API Tree' } ]
  end
end

# Example of a Ruby script for data export
def export_trees_to_csv
  require 'csv'
  CSV.generate do |csv|
    csv << %w[id name depth]
    Tree.all.each do |tree|
      csv << [ tree.id, tree.name, JTreeUtils.tree_depth(tree) ]
    end
  end
end

# Example of a Ruby callback
class Tree < ApplicationRecord
  after_create :notify_creation

  def notify_creation
    puts "Tree #{name} was created!"
  end
end

# End of additional Ruby showcase
