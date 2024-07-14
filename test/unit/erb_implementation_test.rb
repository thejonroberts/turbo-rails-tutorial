# frozen_string_literal: true

require "test_helper"

# https://github.com/Shopify/better-html#testing-for-valid-html-and-erb
class ErbImplementationTest < ActiveSupport::TestCase
  ERB_GLOB = Rails.root.join(
    "app/views/**/{*.htm,*.html,*.htm.erb,*.html.erb,*.html+*.erb}"
  )

  Dir[ERB_GLOB].each do |filename|
    pathname = Pathname.new(filename).relative_path_from(Rails.root)
    test "html errors in #{pathname}" do
      data = File.read(filename)
      BetterHtml::BetterErb::ErubiImplementation.new(data, filename:).validate!
    end
  end
end
