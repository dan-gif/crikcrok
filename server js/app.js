const express = require('express');
const morgan = require('morgan');
const path = require('path');
const route = require('./routes');
const errorHandler =require('errorhandler');

require ('./database');

const app = express();
exports.app =app;
const port = process.env.PORT || 3000;

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

require('./config/session.config');
require('./config/passport.config');

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded({ extended:true }));
app.use(morgan('tiny'));
app.use(route);

console.log(process.env.NODE_ENV);

if(process.env.NODE_ENV === 'development'){
    app.use(errorHandler());
} else {
    app.use((err,req,res,next)=>{
        const codes = err.code|| 500
        res.status(codes).json({
            code:codes,
            message: codes === 500? null : err.message
        })
    });
}



app.listen(port);