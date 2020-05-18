const mongoose = require('mongoose');
const schema = mongoose.Schema;
const bcrypt= require('bcrypt')
var uniqueValidator = require('mongoose-unique-validator');

const userSchema = schema({
    pseudo: {type:String , required:true, unique: true },
    local:{
        username: {type:String , required:true},
        firstname: {type:String , required:true},
        email: {type:String , required:true,unique: true },    
        password: {type:String , required:true},
    }
});

userSchema.plugin(uniqueValidator);


userSchema.statics.hashPassword=(password)=>{
    return bcrypt.hash(password, 12);
}
userSchema.methods.comparePassword = function(password) {
  return bcrypt.compare(password, this.local.password)
}

const User = mongoose.model('user', userSchema);

module.exports = User;