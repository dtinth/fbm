fbm
===

Send Facebook Messages from your terminal.


Installation
------------

    gem install fbm


Usage
-----

    fbm login

It will give you a link, login and copy the success URL back to the application.

    fbm ls Thai

It will list all friends that contains "Thai" in their name.

    echo some text | fbm send Thai

It will send "some text" to Thai. If it matches multiple Thais, nothing will be sent, you must type the full name so that
it matches one name.


More Example
------------

Sending a code snippet to Gist using [Jist](https://github.com/ConradIrwin/jist) and send via Facebook.

    jist filename.c | fbm send Recipient

Sometimes it can be a good idea to save the message that you send.

    jist filename.c | tee ~/.fbm_prev | fbm send Recipient

Contribute
----------
This is my first Gem, and I'm very new to this. However, this app does just what I want now.

Contributions welcome. If you want you can make this app more structured, or make it print to stderr instead of stdout, or add unit tests.



