class Book < ApplicationRecord
  after_create_commit { broadcast_prepend_to :books }
  after_update_commit { broadcast_replace_to "book_#{id}".to_sym }

  validates :title, :description, presence: true
end
