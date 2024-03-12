import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="add-form"
export default class extends Controller {
  static targets = ["imageForm"];
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  displayForm(e) {
    e.preventDefault();
    this.imageFormTarget.classList.toggle("d-none");
  }
}
