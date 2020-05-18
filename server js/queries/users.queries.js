const User = require('../database/models/user.model');

exports.createUser = async(user) => {
  try {
    const hashedPassword = await User.hashPassword(user.password);
    const newUser = new User({
      pseudo: user.pseudo,
      local: {
        firstname: user.firstname,
        username: user.username,
        email: user.email,
        password: hashedPassword
      }
    })
    return newUser.save();
    
  } catch(e) {
    throw e;
  }
}



exports.findUserPerPseudo = (pseudo) => {
  return User.findOne({ 'pseudo': pseudo }).exec();
}

exports.findUserPerId = (id) => {
  return User.findById(id).exec();
}
