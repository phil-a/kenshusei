defmodule Kenshusei.Email do
    import Bamboo.Email

    def contact_email do
        new_email(
            to: "phil.alekseev@gmail.com",
            from: "zenwarrior@bellnet.ca",
            subject: "Kenshusei Martial Arts",
            html_body: "<strong>We thank you for your interest. Someone will be in contact with you shortly.</strong>",
            text_body: "We thank you for your interest. Someone will be in contact with you shortly."
        )
    end
end