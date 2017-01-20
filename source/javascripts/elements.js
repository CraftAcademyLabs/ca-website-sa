// Handle element code layout
$(document).ready(function() {
  var $elements = $('.element');
  var $codes = $('.tab-content--code code');
  $.each($codes, function(i, el) {
    var innerCode = el.innerHTML;
    // assuming the next line is indented
    var firstLineSpaces = innerCode.match(/ {4,}/g)[1].length - 2
    var replacements = new RegExp(" {" + firstLineSpaces + "}", "g");
    var fixedCode = innerCode.replace(replacements, '');
    el.innerHTML = fixedCode;
  });
});