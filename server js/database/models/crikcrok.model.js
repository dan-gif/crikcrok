const mongoose = require('mongoose');
const schema = mongoose.Schema;
const imageMimeTypes = ['image/jpeg', 'image/png', 'images/gif']

const crikcrokSchema = schema({
    content: { 
        type: String, 
        maxlength: [140,'crikcrok trop long'], 
        minlength: [10,'crikcrok trop court'],
        required: [true,'champ requis']
    }
    
});
  
const Crikcrok = mongoose.model('crikcrok', crikcrokSchema);

module.exports = Crikcrok;