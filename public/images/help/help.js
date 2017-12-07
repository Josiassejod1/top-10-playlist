const accountSid = 'AC6ecaf88eab8ca6edb110a2088e681d11';
const authToken = '825fc5eb496257c5d99468b20865f2';

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
      to: '+12027317527',
          from: '+14108921586',
	      body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
	        })
		  .then((message) => console.log(message.sid));
