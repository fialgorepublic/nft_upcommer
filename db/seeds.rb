plan_data = [
              { name: 'Free Plan', day_price: '', week_price: '', description_list: [
                "Get listed on minting and upcoming page",
                "Standard review listing up to 48 hours",
                "Standard support queue 9am - 6pm CET",
                "Only 1 out of 10 projects pass through moderation due to high demand",
              ], image: File.open("#{Rails.root}/app/assets/images/Free-Plan.svg")},
              { name: 'HomePage Plan', day_price: 12.3, week_price: 23.7, description_list: [
                "Best visibility possible, position on top of the homepage",
                "Express listing - less than 2 hours",
                "Premium support queue available 24/7",
                "Guaranteed publication",
              ], image: File.open("#{Rails.root}/app/assets/images/Homapage-Plan.svg")  },
              { name: 'Blue Chip Project Plan', day_price: 11.1, week_price: 32.3, description_list: [
                "Premium listing, position on every page",
                "Express listing - less than 2 hours",
                "Premium support queue available 24/7",
                "Guaranteed publication",
              ], image: File.open("#{Rails.root}/app/assets/images/BlueChip-Plan.svg") },
              { name: 'Featured Nft Drops', day_price: 31.5, week_price: 43.8, description_list: [
                "Featured listing, highlighted position",
                "Express listing - less than 2 hours",
                "Premium support queue available 24/7",
                "Guaranteed publication",
              ], image: File.open("#{Rails.root}/app/assets/images/BestOption-Plan.svg") },
              { name: 'SIDEBAR NFT PLAN', day_price: 52.7, week_price: 74.9, description_list: [
                "Sidebar listing, side position",
                "Express listing - less than 2 hours",
                "Premium support queue available 24/7",
                "Guaranteed publication",
              ], image: File.open("#{Rails.root}/app/assets/images/Sidebar-NFT-Plan-Image.svg") }
            ]
plan_data.each do |plan|
  create_plan = Plan.find_or_create_by(
    name: plan[:name],
    day_price: plan[:day_price],
    week_price: plan[:week_price],
    description_list: plan[:description_list] 
  )
  create_plan.image.attach(io: File.open(plan[:image]), filename: "1_#{Time.current.to_i}", content_type: 'image/png')
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')