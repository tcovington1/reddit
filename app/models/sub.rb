class Sub < ApplicationRecord
  #associations 
  #validcations
  has_many :topics, dependent: :destroy
end
