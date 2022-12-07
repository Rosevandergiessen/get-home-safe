import { Controller } from "@hotwired/stimulus"
import user_location_controller from "./user_location_controller";

// Connects to data-controller="help-button"
export default class extends Controller {
  connect() {
    console.log("dasdsd")

    console.log("hello, this is Ferdi from the Stimulus controller");
  }

  help() {
    fetch('/voice').then(response => response.json).then(data => console.log("Message sent"))
  }
}
