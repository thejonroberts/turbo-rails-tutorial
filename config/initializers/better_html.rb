# https://github.com/Shopify/better-html#configuration
# Keep in line with erb_lint with a shared config:
BetterHtml.config = BetterHtml::Config.new(YAML.load_file(Rails.root.join(".better-html.yml"), permitted_classes: [Regexp]))

BetterHtml.configure do |config|
  # exclude templates provided by gem libraries
  config.template_exclusion_filter = proc { |filename| !filename.start_with?(Rails.root.to_s) }
end
