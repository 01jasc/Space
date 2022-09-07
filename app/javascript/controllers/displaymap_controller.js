import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = [ "map" ]


  connect() {
    console.log("Hello from Display Map")
  }
  show() {
    this.mapTarget.classList.remove("d-none")
    this.mapTarget.resize();

  }

  hide() {
    this.mapTarget.classList.add("d-none")
  }
}