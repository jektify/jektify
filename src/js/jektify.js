/*!
  * Jektify v1.0.5 (https://williamcanin.me/jektify/)
  * Copyright 2020
  * Licensed under MIT (https://github.com/williamcanin/jektify/blob/master/LICENSE)
  */
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".jektify__button").forEach(button => {
    button.addEventListener("click", () => {
      const nextElem = button.parentElement.nextElementSibling;
      if (nextElem) {
        // toggle efeito tipo slide (simplificado)
        if (nextElem.style.maxHeight) {
          nextElem.style.maxHeight = null;
        } else {
          nextElem.style.maxHeight = nextElem.scrollHeight + "px";
        }
      }

      button.classList.remove("jektify__button--closed");
      button.classList.toggle("jektify__button--open");
    });
  });
});

