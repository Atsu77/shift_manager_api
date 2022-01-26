FactoryBot.define do
  factory :student do
    name { 'Atsu' }
    email { 'user@example.com' }
    password { 'password' }
    address { '東京都品川区' }
    phone_number { '123456789' }
    join_date { Time.zone.now }
  end
end
