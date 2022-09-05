import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

export default class extends Controller {
  connect() {
    console.log("hello star rating")
    new StarRating(this.element)
    console.log("hello after new Star")
  }
}
