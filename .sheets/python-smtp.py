#!/bin/python

def send_mail():
    import smtplib

    gmail_user=''
    gmail_password=''

    FROM=''
    TO=['', '']
    SUBJECT='This is a random experiment'
    TEXT='Congratulations this works'

    message='FROM: %s\nTO: %s\nSUBJECT: %s\n\n %s' %(FROM, ','.join(TO), SUBJECT, TEXT)

    try:
        server = smtplib.SMTP('smtp.gmail.com', 587)
        print 'Establishing Connection'
        server.ehlo()
        print 'Setting up TLS'
        server.starttls()
        print 'Restablishing TLS connection'
        server.ehlo()
        print 'Authenticating user'
        server.login(gmail_user, gmail_password)
        print 'Sending Message'
        server.sendmail(FROM, TO, message)
        print 'Closing Connection'
        server.close()
    except:
        print 'Message not sent'

send_mail()
