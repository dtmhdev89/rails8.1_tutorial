import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tooltip", "name"]
  static values = { name: String }

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

  update_name_value(event) {
    this.nameValue = this.nameTarget.value
  }

  nameValueChanged() {
    console.log(this.nameValue)
  }
}
