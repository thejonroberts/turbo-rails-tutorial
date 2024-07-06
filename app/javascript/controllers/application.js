import { Application } from "@hotwired/stimulus"

const application = Application.start()

// set `STIMULUS_DEBUG = 1` in `.env.local` to enable debug mode. see /app/views/layouts/application.html.erb
if (document.head.querySelector("meta[name=stimulus_debug]")) {
  application.debug = true
}

window.Stimulus   = application

export { application }
