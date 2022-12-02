// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// const activate = document.querySelector(".activate")

// activate.classList.toggle("avatar-active")

// const call = () => {
//   const options = {
//     enableHighAccuracy: true,
//     timeout: 5000,
//     maximumAge: 0
//   };

//   function success(pos) {
//     const crd = pos.coords;

//     fetch(`http://localhost:3000/send_location?lat=${crd.latitude}&lng=${crd.longitude}`)
//     .then(response => response.text())
//     .then(data => console.log(data))

//     console.log('Your current position is:');
//     console.log(`Latitude : ${crd.latitude}`);
//     console.log(`Longitude: ${crd.longitude}`);
//     console.log(`More or less ${crd.accuracy} meters.`);
//   }

//   function error(err) {
//     console.warn(`ERROR(${err.code}): ${err.message}`);
//   }

//   navigator.geolocation.getCurrentPosition(success, error, options)
// }


//   window.setInterval(navigator.geolocation.getCurrentPosition(success, error, options), 6000)
