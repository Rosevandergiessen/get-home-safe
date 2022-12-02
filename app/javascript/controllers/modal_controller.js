import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["map"]

  connect() {

  }

  show() {
    this.mapTarget.classList.toggle("d-none")
    this.mapTarget.resize()
  }
}
