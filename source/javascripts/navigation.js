(function(){
  var $nav = $('header.navigation.auto-hide');

  //For showing and hiding navigation
  var hideNav = function() {
    // only affect desktop navigation
    $nav.addClass('hidden-nav');
  };

  $(document).ready(function() {
    // only affect desktop navigation
    // hide after 5 seconds
    var timeOut = window.setTimeout(hideNav, 5000);

    $nav.hover(
    function() { clearTimeout(timeOut); },
    function() { timeOut = window.setTimeout(hideNav, 5000); }
    );

    var lastScrollTop = 0;

    $(window).scroll(function(e) {
      var scrollTop = $(this).scrollTop();

      if (scrollTop > 0 && scrollTop > lastScrollTop) {
        // on scroll down, hide nav
        $nav.addClass('hidden-nav');
      } else {
        // on scroll up, show nav
        $nav.removeClass('hidden-nav');
      }

      lastScrollTop = scrollTop;
    });
  });
}());
