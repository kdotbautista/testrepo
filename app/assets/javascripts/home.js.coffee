$(document).ready ->
  # Show the nav "top" link when the user has scrolled down
  topOfOthDiv = $("#speakers").offset top
  $(window).scroll ->
    # scrolled past the Speakers div?
    if $(window).scrollTop() > topOfOthDiv
      $("[data-js='top-link']").removeClass("hidden")
    # Scrolled to top of page
    if $(window).scrollTop() is 0
      $("[data-js='top-link']").addClass("hidden")

  # Mobile dropdown navigation
  # Expand the navigation
  $("[data-js='mobile-expand-nav']").click ->
    $("[data-js='mobile-nav']").slideToggle 'fast'
    return
  # Close the navigation
  $("[data-js='nav-target']").click ->
    $("[data-js='mobile-nav']").slideToggle 'fast'
    return
