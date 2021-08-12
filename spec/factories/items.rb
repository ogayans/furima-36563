FactoryBot.define do
  factory :item do
    title         {"タイトル"}
    text          {"商品説明"}
    category_id   {2}
    condition_id  {2}
    load_id       {2}
    prefecture_id {2}
    day_id        {2}
    price         {300}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
