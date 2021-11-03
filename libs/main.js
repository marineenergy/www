$(window).onload = winSize();

$(window).resize(winSize);

function winSize() {
  if ($(window).width() < 1400) {
    $('.card-container').css({
      'display': 'none'
    })
    $('.banner-container').css({
      'display': 'block'
    })
  } else {
    $('.card-container').css({
      'display': 'block'
    })
    $('.banner-container').css({
      'display': 'none'
    })
  }
}


