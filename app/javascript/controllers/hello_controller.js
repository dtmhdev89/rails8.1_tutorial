import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tooltip"]
  connect() {
    console.log("Hello world")
  }

  show_tooltip() {
    console.log("Name tooltips")
    this.tooltipTarget.classList.remove("hidden") 
    this.tooltipTarget.classList.add("visible")
  }

  hide_tooltip() {
    this.tooltipTarget.classList.remove("visble")
    this.tooltipTarget.classList.add("hidden")
  }
}
