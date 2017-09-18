// Scroll to contact section
$(document).on('click','#contact-button', function(event) {
    event.preventDefault();
    var target = "#section-contact-us"
    $('html, body').animate({
        scrollTop: $(target).offset().top
    }, 1600);
});