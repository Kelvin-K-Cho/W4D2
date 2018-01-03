class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description,
  presence: true

  validates :color,
  inclusion: { in: ['black', 'gray', 'yellow', 'brown'], message: "%{value} is not a valid color" }
  validates :sex,
  inclusion: { in: ['M', 'F'], message: "%{value} is not a valid sex" }


end
