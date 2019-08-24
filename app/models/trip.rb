class Trip < ApplicationRecord
  # Direct associations

  has_many   :destinations,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
