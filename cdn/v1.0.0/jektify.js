/*!
  * Jektify v1.0.0 (https://github.com/jektify/jektify)
  * Copyright 2018
  * Licensed under MIT (https://raw.githubusercontent.com/jektify/jektify/master/LICENSE.txt)
  */
$(document).ready(function(){
  $(".jektify__button").click(function(){
    $(this).parent().next().slideToggle();
    $(this).removeClass('jektify__button--closed');
    $(this).toggleClass("jektify__button--open");
  });
});
