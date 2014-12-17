$(document).ready(function() {
    $('.pgwSlideshow').pgwSlideshow();
    pgwSlideshow.startSlide();
    pgwSlideshow.displaySlide(3);
    pgwSlideshow.nextSlide();
    pgwSlideshow.previousSlide();
});



pgwSlideshow.reload({
    transitionEffect : 'fading',
    adaptiveDuration : 4000
});