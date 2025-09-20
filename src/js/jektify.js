/*!
  * Jektify v1.0.8 (https://williamcanin.me/jektify/)
  * Copyright 2025
  * Licensed under MIT (https://github.com/williamcanin/jektify/blob/master/LICENSE)
  */

// Javascript: Bug
// document.addEventListener("DOMContentLoaded", () => {
//   document.querySelectorAll(".jektify__button").forEach(button => {
//     button.addEventListener("click", () => {
//       const nextElem = button.parentElement.nextElementSibling;
//       if (nextElem) {
//         // toggle efeito tipo slide (simplificado)
//         if (nextElem.style.maxHeight) {
//           nextElem.style.maxHeight = null;
//         } else {
//           nextElem.style.maxHeight = nextElem.scrollHeight + "px";
//         }
//       }

//       button.classList.remove("jektify__button--closed");
//       button.classList.toggle("jektify__button--open");
//     });
//   });
// });

// JQUERY
jQuery(function($) {
  $(".jektify__button").on("click", function() {
    $(this).parent().next().slideToggle();
    $(this).removeClass("jektify__button--closed")
           .toggleClass("jektify__button--open");
  });
});


