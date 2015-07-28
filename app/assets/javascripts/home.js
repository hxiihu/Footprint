
/*Downpage Animation*/

$(document).ready(function(){

	$('.dropdown-toggle').click(function(){
		$('.dropdown-menu').toggle();
	});

	$('.right-nav').click(function() {
    var currentSlide = $('.active-slide');
    var nextSlide = currentSlide.next();

    var currentDot = $('.active-dot');
    var nextDot = currentDot.next();

    /* Until the last slide (empty slide) */
    if(nextSlide.length === 0) {
      nextSlide = $('.slide').first();
      nextDot = $('.dot').first();
    }
    
    currentSlide.fadeOut(800).removeClass('active-slide');
    nextSlide.fadeIn(800).addClass('active-slide');

    currentDot.removeClass('active-dot');
    nextDot.addClass('active-dot');
	});


	$('.left-nav').click(function() {
    var currentSlide = $('.active-slide');
    var prevSlide = currentSlide.prev();

    var currentDot = $('.active-dot');
    var prevDot = currentDot.prev();

    if(prevSlide.length === 0) {
      prevSlide = $('.slide').last();
      prevDot = $('.dot').last();
    }
    
      currentSlide.fadeOut(800).removeClass('active-slide');
      prevSlide.fadeIn(800).addClass('active-slide');

      currentDot.removeClass('active-dot');
      prevDot.addClass('active-dot');
    });

    $('.viewposts').click(function(){
        $('.popupbox').fadeOut(200).removeClass('active-popupbox');
        $('.page1').fadeOut(400).removeClass('active-page');
        $('.page2').fadeIn(800).addClass('active-page');
    });

    $('.linktomap').click(function(){
        $('.page2').fadeOut(200).removeClass('active-page');
        $('.page1').fadeIn(800).addClass('active-page');
    });

    $('#holder_1000').click(function(){
        $('.popupbox').slideDown(300).addClass('active-popupbox');
    });

    $('.crossicon').click(function(){
        $('.popupbox').fadeOut(600).removeClass('active-popupbox');
    });

    $('.pagination').click(function(){
        $('.page1').removeClass('active-page');
        $('.page2').fadeIn(300).addClass('active-page');
    });

});

