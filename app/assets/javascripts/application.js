// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    
    //icon.removeClass('ico');
});

var main = function() {
    var icon = $('.ico');


$('.arrow-next').click(function() {
	
    var currentSlide = $('.active-slide');
    var nextSlide = currentSlide.next();
    var lazyimg = $('.lazy');
    var btn = $('.btn_more');

    var currentDot = $('.active-dot');
    var nextDot = currentDot.next();

    if(nextSlide.length === 0) {
      nextSlide = $('.slide').first();
      nextDot = $('.dot').first();
    };

    currentSlide.fadeOut(600).removeClass('active-slide');
    nextSlide.fadeIn(200).addClass('active-slide');
    icon.removeClass('ico')

    currentDot.removeClass('active-dot');
    nextDot.addClass('active-dot');

    lazyimg.hide().fadeIn(200).removeClass('lazy');
    btn.hide().fadeIn(200);
  });

 $('.arrow-prev').click(function() {
    var currentSlide = $('.active-slide');
    var prevSlide = currentSlide.prev();

    var currentDot = $('.active-dot');
    var prevDot = currentDot.prev();

    if(prevSlide.length === 0) {
      prevSlide = $('.slide').last();
      prevDot = $('.dot').last();
    }
    
    currentSlide.fadeOut(600).removeClass('active-slide');
    prevSlide.fadeIn(200).addClass('active-slide');
    icon.removeClass('ico')

    currentDot.removeClass('active-dot');
    prevDot.addClass('active-dot');
  });

}

$( function() {
        $( '.type-text' ).teletype( {
            text: [ 'independent', 'fresh', 'innovative' ],
            typeDelay: 0,
            backDelay: 20
        } );
    } );

$(document).ready(main);
