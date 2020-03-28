class House < ApplicationRecord

  validates :house_name, presence: true
  validates :rent, presence: true
  validates :house_address, presence: true
  validates :house_age, presence: true

  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :reject_both_blank


  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line].blank? and attributes[:station_name].blank? and attributes[:minutes_on_foot].blank?
      !attributes[:line].blank? and attributes[:station_name].blank? and attributes[:minutes_on_foot].blank?
    else
      attributes[:line].blank? and attributes[:station_name].blank? and attributes[:minutes_on_foot].blank?
    end
  end
end