// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// disable Turbo on the whole application
// (also need  <body data-turbo="false"> in views/layouts/application.html.erb)
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false
