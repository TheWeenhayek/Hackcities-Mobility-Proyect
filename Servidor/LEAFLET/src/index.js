// arranca el codig o desl servidor
const express = require('express');
const engine = require('ejs-mate');
const path = require('path');

// inicializations
const app = express();

// settings
app.engine('ejs', engine);
app.set('view engine', 'ejs');
// avisamos donde esta la direccion de views
app.set('views', path.join(__dirname, 'views'));

// routes
app.get('/',(req,  res) => {
    res.render('index');
});

// starting the server
app.listen(3000, () =>{
    console.log('Server on port 3000');
});

