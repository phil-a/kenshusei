defmodule Kenshusei.Email do
  import Bamboo.Email

  def contact_email(form_submission) do
    new_email(
      to: form_submission.email,
      from: System.get_env("SENDGRID_EMAIL_RECIPIENT"),
      subject: "Zen Warrior Martial Arts",
      html_body:
        "<p>Hello #{form_submission.name},<p> Thank you for your interest in Zen Warrior Martial Arts.<br>You should receive a response from us shortly. For more information about our training classes, please call <a href='tel:9057607679'>905-760-7679</a>.</p><p>Thank you,<br>Sensei</p>",
      text_body:
        "Hello #{form_submission.name}, Thank you for your interest in Zen Warrior Martial Arts. You should receive a response from us shortly. For more information about our training classes, please call 905-760-7679. Thank you, Sensei"
    )
  end

  def owner_email(form_submission) do
    new_email(
      to: System.get_env("SENDGRID_EMAIL_RECIPIENT"),
      from: form_submission.email,
      subject: "Zen Warrior Martial Arts: Contact Form",
      html_body: "
                            <p>
                                #{form_submission.comment}
                            </p>
                            <p>
                                - #{form_submission.name}
                            </p>
                            <br />
                            (Email sent via contact form submission)
                        ",
      text_body: "
                            #{form_submission.comment}
                            - #{form_submission.name}
                            (Email sent via contact form submission)
                        "
    )
  end
end
