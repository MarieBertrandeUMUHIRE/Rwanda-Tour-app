class Image < ApplicationRecord
 belongs_to :destination, optional: true
end
