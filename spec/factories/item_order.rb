FactoryBot.define do
  factory :item_order do
    post_code                  { '814-0032' }
    prefecture_id                  { 2 }
    city                   { '福岡市' }
    house_number              { '小田部７丁目' }
    phone_number            { '09012345678' }
    building_name            { '福岡ビル' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
