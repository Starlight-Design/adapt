$(document).ready(function(e) {
  // Variables //
  var i = 1 // Start incrementing at 1
  var slideul = $('slideshow ul'); // Create variable for selecting the slideshow unordered list.


  $('a[href*=#]').on('click', function(e){
        e.preventDefault(); // Prevent all 'a' tags with an href of # from running standard action
        href = $(this).attr('href'); // Refer href to clicked 'a' tag
        locy = $(href).position().top - 100; // Specify a Y-axis location by selecting the very top of the href as the current position. Offset by 100 px for header.
        $('html, body').animate({scrollTop:locy+"px"},500); // Select the HTML and body and scroll it by the pixel value of 'locy'. Do this over .5 seconds.
    });

/* Every time the window is scrolled */
    $(window).scroll(function(){
    
        /* Check the location of each desired element */
        $('.hide').each(function(i){
            
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height() - 300;
            
            /* If the object is completely visible in the window, fade it in */
            if(bottom_of_window > bottom_of_object){
                
                $(this).animate({'opacity':'1'},500);  
            } 
        }); 
    });

    $('.submitBTN').on('click', function(e){
      e.preventDefault();
    });
});