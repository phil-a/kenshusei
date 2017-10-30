defmodule Kenshusei.Email do
    import Bamboo.Email

    def contact_email(form_submission) do
        new_email(
            to: form_submission.email,
            from: System.get_env("SENDGRID_EMAIL_RECIPIENT"),
            subject: "Kenshusei Martial Arts",
            html_body: "<p>Hello #{form_submission.name},<p> We thank you for your interest in Kenshusei Martial Arts.<br>While we appreciate you reaching out to us via email, we are traditionally much more attainable via telephone. If you are serious about training, do not hesitate to call us at <a href='tel:9057607679'>905-760-7679</a>.</p><p>Thank you,<br>Sensei</p>",
            text_body: "Hello #{form_submission.name}, We thank you for your interest in Kenshusei Martial Arts. While we appreciate you reaching out to us via email, we are traditionally much more attainable via telephone. If you are serious about training, do not hesitate to call us at 905-760-7679. Thank you, Sensei"
        )
    end

    def owner_email(form_submission) do
        new_email(
            to: System.get_env("SENDGRID_EMAIL_RECIPIENT"),
            from: "noreply@kenshuseimartialarts.com",
            subject: "Kenshusei Martial Arts",
            html_body: "<p>Hello Sensei, <br><br>
                        A person by the name: <strong>#{form_submission.name}</strong> <br>
                        with the email: <strong>#{form_submission.email}</strong> <br>
                        has recently used the contact form on your website to try and contact you.</p>
                        <p>They have left the following message: <br><strong>#{form_submission.comment}</strong></p>",
            text_body: "Hello Sensei, 
                        A person by the name: #{form_submission.name} 
                        with the email: #{form_submission.email} 
                        has recently used the contact form on your website to try and contact you.
                        They have left the following message: #{form_submission.comment}"
        )
    end
end