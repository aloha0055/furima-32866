class ShippingArea < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '北海道' },
    { id: 3, name: '東北' },
    { id: 4, name: '北陸' },
    { id: 5, name: '関東' },
    { id: 6, name: '関西' },
    { id: 7, name: '中国四国' },
    { id: 8, name: '九州・沖縄' },
  ]

  include ActiveHash::Associations
  has_many :items
  
end