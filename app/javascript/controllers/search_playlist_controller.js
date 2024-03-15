import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input", "result", "searchIcon"];

  connect() {
    this.inputTarget.addEventListener('focus', this.hideSearchIcon.bind(this));
    this.inputTarget.addEventListener('blur', this.showSearchIcon.bind(this));
  }

  update(e) {
    e.preventDefault();

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        this.resultTarget.outerHTML = data;
      });
  }

  clear() {
    this.inputTarget.value = "";
  }

  hideSearchIcon() {
    this.searchIconTarget.style.display = 'none';
  }

  showSearchIcon() {
    this.searchIconTarget.style.display = 'block';
  }
}
