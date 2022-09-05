import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]
  static values = { position: String }

  connect() {
    console.log("hello from inser list controller")
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }
  send(event) {
    event.preventDefault()
    console.log(this.formTarget.action)
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
