require 'selenium-webdriver'

desc "Get User likes"
namespace :nft_event do
  task get_likes: :environment do
    NftEvent.find_each  do |event|
        options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
        driver = Selenium::WebDriver.for(:firefox, options: options)
        begin
        driver.get(event.twitter_link)
        sleep(5)
        twitter_follower_count = driver.find_elements(:xpath, "//span[@class='css-901oao css-16my406 r-poiln3 r-bcqeeo r-qvutc0']")[27].text
        event.update(twitter_follower_count: twitter_follower_count.gsub(",", ""))
        rescue => e
            puts "Twitter error message #{e.message}"
        end

        begin
        driver.get(event.discord_link)
        sleep(5)
        discord_count = driver.find_elements(:xpath, "//span[@class='defaultColor-24IHKz text-sm-normal-3Zj3Iv pillMessage-3pHz6R']")[1].text.split(" ")[0]
        event.update(discord_follower_count: discord_count.gsub(",", ""))
        rescue => e
            puts "Discord error message #{e.message}"
        end
        # driver.close

        # driver = Selenium::WebDriver.for(:firefox, options: options)
        begin
        driver.get(event.market_place_link)
        sleep(5)
        facebook_count = driver.find_elements(:xpath, "//span[@class='gvxzyvdx aeinzg81 t7p7dqev gh25dzvf ocv3nf92 k1z55t6l oog5qr5w tes86rjd pbevjfx6']")[2].text.split(" ")[0]
        event.update(marketplace_follower_count: facebook_count.gsub(",", ""))
        driver.close
        rescue => e
            puts "Facebook error message #{e.message}"
            driver.close
        end
    end
  end
end