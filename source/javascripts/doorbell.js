window.doorbellOptions = {
  strings: {
    'feedback-button-text': 'Har du frågor?',

    'title': 'Kontakta oss',
    'intro-text': 'Vill du veta mer om Craft Academy Bootcamp? Ställ din fråga nedan eller ring oss på 0735-403500',
    'feedback-textarea-placeholder': 'Din fråga...',
    // 'feedback-label': '(empty)',
    'email-input-placeholder': 'Din mailadress',
    // 'email-label': '(tom)',
    'attach-a-screenshot': 'Visa oss vad du tittar på',
    'submit-button-text': 'Skicka',
    // 'add-attachments-label': 'Add an attachment',

    'message-success' : 'Meddelandet är skickat!',
    'message-error-missing-email': 'Hmm... Du måste ange en email adress',
    'message-error-invalid-email': 'Email adressen du angav verkar ogiltig...',
    'message-error-missing-message': 'Meddelandet är tomt, var det meningen?',
    'message-error-message-too-short': 'Lite väl kort meddelande...'
  },
  appKey: 'zF0anPyXM2iItB1yfkqhwe8iMBdR4mBuiKPuwH2oe0OuFBvK9IFoksmZVigjgaGS'
};
(function(d, t) {
    var g = d.createElement(t);g.id = 'doorbellScript';g.type = 'text/javascript';g.async = true;g.src = 'https://embed.doorbell.io/button/1974?t='+(new Date().getTime());(d.getElementsByTagName('head')[0]||d.getElementsByTagName('body')[0]).appendChild(g);
}(document, 'script'));
