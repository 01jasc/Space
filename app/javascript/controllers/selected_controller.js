import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  connect() {
    this.trigger = {
      Gym: false,
      Bouldering: false,
      Climbing: false,
      Swimming: false,
      Tennis: false,
      Volleyball: false,
      MMA: false,
      Badminton: false,
      Kayaking: false,
    }
  }

  select(e) {
    this.trigger[`${e.currentTarget.innerText}`] =  !this.trigger[`${e.currentTarget.innerText}`]
    console.log(this.trigger)
  };


  sendOfParams() {
    console.log("params activated")

    let url = "/facilities?"
    let params = new URLSearchParams()

    for (const [key, value] of Object.entries(this.trigger)) {
      if (value) {
        params.set(key, value)
      }
    }

    window.open(url + params.toString(), "_self")
  }
}
