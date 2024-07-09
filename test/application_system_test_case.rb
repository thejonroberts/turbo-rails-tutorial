require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  browser = ENV.fetch("BROWSER", :headless_chrome).to_sym
  driven_by :selenium, using: browser, screen_size: [1400, 1400]
end
