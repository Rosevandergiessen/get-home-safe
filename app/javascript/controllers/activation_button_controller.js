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
        console.log("albert")
      }
    })
  }

  change() {
    if(this.imageTarget.classList.contains('avatar-active')) {
      // for production
      // fetch('https://teamgethomesafe.herokuapp.com/deactivate')
      fetch(`http://localhost:3000/deactivate`)
      .then(response => response)
      .then(data => console.log(data))
    } else {
      // for production
      // fetch('https://teamgethomesafe.herokuapp.com/activate')
      fetch(`http://localhost:3000/activate`)
      .then(response => response)
      .then(data => console.log(data))
    }

    this.imageTarget.classList.toggle("avatar-active")

    const myTarget = document.querySelector(".my-target")

    if(myTarget.innerText ==  "false") {
      myTarget.innerText = "true"
    } else {
      myTarget.innerText = "false"
    }

    const options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      const crd = pos.coords;

        // for production
        // fetch(`https://teamgethomesafe.herokuapp.com/send_location?lat=${crd.latitude}&lng=${crd.longitude}`)
        fetch(`http://localhost:3000/send_location?lat=${crd.latitude}&lng=${crd.longitude}`)
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

    // const danko = () => {
      navigator.geolocation.getCurrentPosition(success, error, options);
    // }

  }
}
