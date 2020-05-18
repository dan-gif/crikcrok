const mongoose = require('mongoose');

mongoose.connect('mongodb+srv://dan:dan@cluster0-xikbp.gcp.mongodb.net/crikcrok?retryWrites=true&w=majority',{useUnifiedTopology:true, useNewUrlParser:true})
        .then( ()=> console.log('connexion db ok'))
        .catch( (err)=>console.log(err))