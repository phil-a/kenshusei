// Scroll to contact section
$(document).on('click','#contact-button', function(event) {
    if (location.pathname == "/") {
        event.preventDefault();
        var target = "#section-contact-us"
        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 1600);
    }
});

$(document).ready(function () {    
    $('#contact_email').keyup(function () {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

        if (re.test($(this).val())) {
            $(".now-ui-icons.ui-1_email-85").removeClass("error-color");
            document.getElementById("contact_submit").disabled = false;
        } else {
            $(".now-ui-icons.ui-1_email-85").addClass("error-color");
            document.getElementById("contact_submit").disabled = true;
        }
    });
    
});