import { Controller } from "@hotwired/stimulus"
import { mapToStyles } from "@popperjs/core/lib/modifiers/computeStyles"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="activation-button"
export default class extends Controller {
  static targets=["image"]
  connect() {

    this.channel = createConsumer().subscriptions.create(

      { channel: "LocationChannel" },
      { received: (data) => {
        const myMap = document.querySelector("#my-map")
        const coords = (data.trim().split(" "))
        myMap.dataset.mapMarkersValue = `[{"lat":${coords[0]},"lng":${coords[1]}}]`
      }
    })
  }

  // change() {
  //   // if(this.imageTarget.classList.contains('avatar-active')) {
  //   //   fetch('http://localhost:3000/deactivate')
  //   //   .then(response => response)
  //   //   .then(data => console.log(data))
  //   // } else {
  //   //   fetch('http://localhost:3000/activate')
  //   //   .then(response => response)
  //   //   .then(data => console.log(data))
  //   // }

    // for production
    change() {
      if(this.imageTarget.classList.contains('avatar-active')) {
        fetch('https://teamgethomesafe.herokuapp.com/deactivate')
        .then(response => response)
        .then(data => console.log(data))
      } else {
        fetch('https://teamgethomesafe.herokuapp.com/activate')
        .then(response => response)
        .then(data => console.log(data))
      }

    this.imageTarget.classList.toggle("avatar-active")



    const options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      const crd = pos.coords;

      // fetch(`http://localhost:3000/send_location?lat=${crd.latitude}&lng=${crd.longitude}`)
      // .then(response => response.text())
      // .then((data) => {
      //   console.log(data)
        // for production
          fetch(`https://teamgethomesafe.herokuapp.com/send_location?lat=${crd.latitude}&lng=${crd.longitude}`)
        .then(response => response.text())
        .then((data) => {
          console.log(data)
      })

      console.log('Your current position is:');
      console.log(`Latitude : ${crd.latitude}`);
      console.log(`Longitude: ${crd.longitude}`);
      console.log(`More or less ${crd.accuracy} meters.`);

    }

    function error(err) {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    }

    navigator.geolocation.getCurrentPosition(success, error, options);

  }
}
