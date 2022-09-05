import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selected"
export default class extends Controller {
  // constructor() {
  //   this.array = []
  // }
  static targets = []

  connect() {
    console.log("hello from select")
  }
  select(e) {
    const selectedParams = []
    let cookie = localStorage.setItem('HTML', 'test')
    // console.log(e.currentTarget.innerText)
    selectedParams.push(e.currentTarget.innerText)
    console.log(cookie)
    console.log(selectedParams)
  }
}
