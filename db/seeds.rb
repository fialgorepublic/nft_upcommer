# plan_data = [
#               { name: 'Free Plan', day_price: '', week_price: '', plan_type: 'free', description_list: [
#                 "Get listed on minting and upcoming page",
#                 "Standard review listing up to 48 hours",
#                 "Standard support queue 9am - 6pm CET",
#                 "Only 1 out of 10 projects pass through moderation due to high demand",
#               ], image: File.open("#{Rails.root}/app/assets/images/Free-Plan.png"), daily_text: '7 day listing', weekly_text: ''},
#               { name: 'HomePage Plan', day_price: 12.3, week_price: 23.7, plan_type: 'home', description_list: [
#                 "Best visibility possible, position on top of the homepage",
#                 "Express listing - less than 2 hours",
#                 "Premium support queue available 24/7",
#                 "Guaranteed publication",
#               ], image: File.open("#{Rails.root}/app/assets/images/Homapage-Plan.png"), daily_text: 'Daily listing', weekly_text: 'Weekly listing (50% off)'  },
#               { name: 'Blue Chip Project Plan', day_price: 11.1, week_price: 32.3, plan_type: 'bluechip', description_list: [
#                 "Premium listing, position on every page",
#                 "Express listing - less than 2 hours",
#                 "Premium support queue available 24/7",
#                 "Guaranteed publication",
#               ], image: File.open("#{Rails.root}/app/assets/images/BlueChip-Plan.png"), daily_text: 'Daily listing', weekly_text: 'Weekly listing (50% off)' },
#               { name: 'Featured Nft Drops', day_price: 31.5, week_price: 43.8, plan_type: 'featured', description_list: [
#                 "Featured listing, highlighted position",
#                 "Express listing - less than 2 hours",
#                 "Premium support queue available 24/7",
#                 "Guaranteed publication",
#               ], image: File.open("#{Rails.root}/app/assets/images/BestOption-Plan.png", daily_text: '', weekly_text: 'Lifetime listing') },
#               { name: 'SIDEBAR NFT PLAN', day_price: 52.7, week_price: 74.9, plan_type: 'sidebar', description_list: [
#                 "Sidebar listing, side position",
#                 "Express listing - less than 2 hours",
#                 "Premium support queue available 24/7",
#                 "Guaranteed publication",
#               ], image: File.open("#{Rails.root}/app/assets/images/Sidebar-Plan.png"), daily_text: 'Daily listing', weekly_text: 'Weekly listing (60% off)' }
#             ]
# plan_data.each do |plan|
#   create_plan = Plan.find_or_create_by(
#     name: plan[:name],
#     day_price: plan[:day_price],
#     week_price: plan[:week_price],
#     description_list: plan[:description_list],
#     plan_type: plan[:plan_type],
#     daily_text: plan[:daily_text],
#     weekly_text: plan[:weekly_text]
#   )
#   create_plan.image.attach(io: File.open(plan[:image]), filename: "1_#{Time.current.to_i}", content_type: 'image/png')
# end
plan = Plan.second
plan.image.attach(io: File.open("#{Rails.root}/app/assets/images/Homapage-Plan.png"), filename: "1_#{Time.current.to_i}", content_type: 'image/png')
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
