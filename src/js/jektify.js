/*!
  * Jektify v1.0.5 (https://williamcanin.me/jektify/)
  * Copyright 2020
  * Licensed under MIT (https://github.com/williamcanin/jektify/blob/master/LICENSE)
  */
$(document).ready( () =>{
  $(".jektify__button").click(function(){
    $(this).parent().next().slideToggle();
    $(this).removeClass('jektify__button--closed');
    $(this).toggleClass("jektify__button--open");
  });
});
