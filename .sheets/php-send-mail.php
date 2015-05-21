if(isset($_POST['email'])) {
    function died($error) {
        // your error code can go here
        echo "We're sorry, but there's errors found with the form you submitted.<br /><br />";
        echo $error."<br /><br />";
        echo "Please go back and fix these errors.<br /><br />";
        die();
    }

    function clean_string($string) {
        $bad = array("content-type","bcc:","to:","cc:","href");
        return str_replace($bad,"",$string);
    }

    // validation expected data exists
    if(!isset($_POST['email']) ||
        !isset($_POST['id']) ||
        !isset($_POST['mobile']) ) {
        died('We are sorry, but there appears to be a problem with the form you submitted.');
    }

    // Global
    $our_email = "srijan.shetty+code@gmail.com";

    // Get details from the form
    $id = $_POST['id']; // required
    $customer_email = $_POST['email']; // required
    $mobile = $_POST['mobile']; // required

    // Send a mail to us
    $headers = 'From: '.$customer_email."\r\n".
        'Reply-To: '.$customer_email."\r\n" .
        'X-Mailer: PHP/' . phpversion();
    $email_to = $our_email;
    $email_subject = "Booking Information";
    $email_message = "Booking Details are below.\n\n";
    $email_message .= "ID: ".clean_string($id)."\n";
    $email_message .= "Email: ".clean_string($customer_email)."\n";
    $email_message .= "Mobile: ".clean_string($mobile)."\n";
    @mail($email_to, $email_subject, $email_message, $headers);

    // Send a mail to the customer
    $headers = 'From: '.$our_email."\r\n".
        'Reply-To: '.$our_email."\r\n" .
        'X-Mailer: PHP/' . phpversion();
    $email_to = $customer_email;
    $email_subject = "What a lovely day!";
    $email_message = "Thanks ". $customer_email.", for giving X a shot!.\n";
    $email_message .= "We'll get in touch shortly to confirm the order.\n";
    $email_message .= "Team X.\n";
    @mail($email_to, $email_subject, $email_message, $headers);
