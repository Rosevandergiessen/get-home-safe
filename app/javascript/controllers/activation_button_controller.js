import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activation-button"
export default class extends Controller {
  static targets=["image"]
  connect() {

  }

  change() {
    this.imageTarget.classList.toggle("avatar-active")

    const options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      const crd = pos.coords;

      console.log('Your current position is:');
      console.log(`Latitude : ${crd.latitude}`);
      console.log(`Longitude: ${crd.longitude}`);
      console.log(`More or less ${crd.accuracy} meters.`);
    }

    function error(err) {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    }


    window.setInterval(navigator.geolocation.getCurrentPosition(success, error, options), 2000);
    // while (true) {

  }
}
