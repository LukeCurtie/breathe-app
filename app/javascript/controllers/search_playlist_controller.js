import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input", "result", "loading"];

  connect() {
    this.loadingTarget.style.display = 'none';
  }

  update(e) {
    e.preventDefault();

    this.loadingTarget.style.display = 'block';

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        this.resultTarget.outerHTML = data;
      })
      .catch((error) => {
        console.error('Error:', error);
      })
      .finally(() => {
        this.loadingTarget.style.display = 'none';
      });
  }

  clear() {
    this.inputTarget.value = "";
  }
}
