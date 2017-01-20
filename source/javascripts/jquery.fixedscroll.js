// Quick and simple plugin for fixing a navbar when you scroll down the page
// Requires a class called fixed-top and fixed-bottom which sets the element to have position: fixed
(function($) {

  var fixedElementTop, $fixedElement, leftOffset;
  var $nav = $('header.navigation');

  // usually called on $('.definition-links')
  function fixedScroll(element) {
    $fixedElement = $(element);
    calculateOffsets();

    $(window).on('scroll', updatePosition);
    $(window).on('resize', updateOnResize);

    $fixedElement.find('a[href^="#"]').on('click', smoothScroll);
  }

  function updatePosition(){
    if (pastBottom()) {
      $fixedElement.css("left", 0);
      $fixedElement.addClass('fixed-bottom');
      $fixedElement.removeClass('fixed-top');
    }
    else if (inPosition()) {
      $fixedElement.css("left", leftOffset);
      $fixedElement.addClass('fixed-top');
      $fixedElement.removeClass('fixed-bottom');
    }
    else
    {
      $fixedElement.removeClass('fixed-top');
      $fixedElement.removeClass('fixed-bottom');
    }
  }

  function updateOnResize(){
    if ($fixedElement.hasClass('fixed-top')) {
      calculateOriginalOffsets('fixed-top');
      $fixedElement.css("left", leftOffset);
    }
    else if ($fixedElement.hasClass('fixed-bottom')) {
      calculateOriginalOffsets('fixed-bottom');
    }
    else {
      calculateOffsets();
    }

    updatePosition();
  }

  // Add some custom animation so it slides smoothly to the location of the
  // internal link. It also hides the nav bar when it gets there to stop the nav
  // from obscuring content
  function smoothScroll(e) {
    e.preventDefault();

    var target = this.hash;
    var $target = $(target);

    $('html, body').stop().animate({
      'scrollTop': $target.offset().top
    }, 900, 'swing', hideNav);
  }

  function hideNav() {
    setTimeout(function() {
      $nav.addClass('hidden-nav');
    }, 50);
  }

  function calculateOffsets(){
    fixedElementTop = $fixedElement.offset().top - parseFloat($fixedElement.css("padding-top"));
    leftOffset = $fixedElement.offset().left;
  }

  // Remove class then calculate offset, then re-add class
  // this is so we can work out the offset before the nav is fixed
  function calculateOriginalOffsets(class_name) {
    $fixedElement.removeClass(class_name);
    calculateOffsets();
    $fixedElement.addClass(class_name);
  }

  function inPosition(){
    var scrollPosition = $(window).scrollTop();
    return scrollPosition > fixedElementTop;
  }

  function pastBottom(){
    var scrollPosition = $(window).scrollTop();
    var elementBottom = scrollPosition + $fixedElement.outerHeight();
    return elementBottom > calculateParentBottom();
  }

  function calculateParentBottom() {
    var $parent = $fixedElement.parent();
    var top = $parent.offset().top;
    var height = $parent.outerHeight();

    return top + height;
  }

  $.fn.fixedScroll = function(options) {
    return this.each(function() {
      fixedScroll(this);
    });
  };
})(jQuery);
