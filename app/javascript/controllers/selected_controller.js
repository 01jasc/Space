import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selected"
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

    // const arr = []
    // if (arr.includes(e.currentTarget.innerText)) {
    //   arr.filter(v => v !== Object.keys(this.trigger).find(key => this.trigger[key] === true));
    // } else {
    //   arr.push(Object.keys(this.trigger).find(key => this.trigger[key] === true));
    // }

    // console.log(arr)

    // console.log(getKeyByValue(this.trigger, true));
  };


  sendOfParams() {
    // categorys (nur mit true values) abgreifen und string generieren, der url + query beinhaltet
    console.log("params activated")
    // fetch("/facilities")
    // .then(response => response.text())
    // .then((data) => {
    // this.resultsTarget
    // })

    let url = "/facilities?"
    let params = new URLSearchParams()

    for (const [key, value] of Object.entries(this.trigger)) {
      if (value) {
        params.set(key, value)
      }
    }

    window.open(url + params.toString(), "_self")
    // console.log(url + params.toString())
  }
}
