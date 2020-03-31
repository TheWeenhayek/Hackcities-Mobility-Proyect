const admin = require('firebase-admin')

//var serviceAccount = require("../../mobility-5b51b-firebase-adminsdk-r1ar7-47056bdf0b.json");
var serviceAccount = require("../../mobilityhack-38794-firebase-adminsdk-e7gn3-271bfee780.json");

admin.initializeApp({
    // credential: admin.credential.applicationDefault(),
    credential: admin.credential.cert(serviceAccount),
    //databaseURL: 'https://mobility-5b51b.firebaseio.com/'
    databaseURL: 'https://mobilityhack-38794.firebaseio.com/'
});
const db = admin.database();

const router = require('express').Router();
const path = require('path');

router.get('/', (req, res) => {
  res.render('index');
});

module.exports = router;
