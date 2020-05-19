const mongoose = require('mongoose');
const schema = mongoose.Schema;

const crikcrokSchema = schema({
    content: { 
        type: String, 
        maxlength: [500,'crikcrok trop long'], 
        minlength: [10,'crikcrok trop court'],
        required: [true,'champ requis']
    },
    author: { type: schema.Types.ObjectId, ref: 'user', required: true }
});
  
const Crikcrok = mongoose.model('crikcrok', crikcrokSchema);

module.exports = Crikcrok;

