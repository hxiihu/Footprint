
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

    $('#micropost_content').click(function(){
      $('#micropost_content').animate({
        height: "150px"
      },
        400);
      $('.uploadpicture').fadeIn(400).addClass('active-page');
      $('.postbutton').fadeIn(400).addClass('active-page');
    });

    $('.postcontainer-inside').click(function(){
      $('#micropost_content').animate({
        height: "50px"
      },
        400);
      $('.uploadpicture').fadeOut(400).removeClass('active-page');
      $('.postbutton').fadeOut(400).removeClass('active-page');
    });

    $('.user_info').click(function(){
      $('#micropost_content').animate({
        height: "50px"
      },
        400);
      $('.uploadpicture').fadeOut(400).removeClass('active-page');
      $('.postbutton').fadeOut(400).removeClass('active-page');
    });

    $('.nav').click(function(){
      $('#micropost_content').animate({
        height: "50px"
      },
        400);
      $('.uploadpicture').fadeOut(400).removeClass('active-page');
      $('.postbutton').fadeOut(400).removeClass('active-page');
    });

    $('#micropost_picture').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
     }
    });

  //  $('.profile .pagination').click(function(){
  //      $('.page1').removeClass('active-page');
  //      $('.page2').fadeIn(300).addClass('active-page');
  //  });


});

