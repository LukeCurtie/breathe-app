// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";

// const addImage = document.querySelector(".fa-image");
// const imageInput = document.querySelector("#image-input");

// addImage.addEventListener("click", () => {
//   addImage.classList.toggle("fa-image");

//   imageInput.classList.toggle("d-none");
// });

// <%= form_for @journal_entry do |f| %>
//   <!-- Other form fields... -->
//   <%= f.file_field :image, id: 'image-input', style: 'display: none;' %>
// <% end %>

// we want the f.file_field to appear when clicking on the Image, allowing the user to add an image

// <%= form_for @journal_entry do |f| %>
//   <!-- Other form fields... -->
//   <%= f.file_field :image, id: 'image-input', style: ';' %>
// <% end %>
