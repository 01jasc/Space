import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log("hello from inser list controller")
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }
}
