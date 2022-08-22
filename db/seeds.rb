plan_data = [
              { name: 'HOMEPAGE', day_price: 12.3, week_price: 23.7 },
              { name: 'BLUE CHIP', day_price: 11.1, week_price: 32.3 },
              { name: 'FEATURED NFT DROPS', day_price: 31.5, week_price: 43.8 },
              { name: 'MINTING AND UPCOMING', day_price: 52.7, week_price: 74.9 },
              { name: 'SIDEBAR NFT', day_price: 89.4, week_price: 137.9 }
            ]
plan_data.each do |plan|
  Plan.find_or_create_by(
    name: plan[:name],
    day_price: plan[:day_price],
    week_price: plan[:week_price]
  )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')