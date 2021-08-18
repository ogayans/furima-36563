FactoryBot.define do
  factory :buy_address do
    postal_code        {"000-0000"}
    prefecture_id      {2}
    municipality       {"市区町村"}
    address            {"番地"}
    building_name      {"建物名"}
    telephone_number   {"0000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
