const passport = require('passport');

exports.signinForm = (req, res, next) => {
  res.render('auth/auth-form', { error: null, isAuthenticated: req.isAuthenticated(), currentUser: req.user });
}

exports.signin = (req, res, next) => {console.log('test34');
  passport.authenticate('local',(err,user,info)=>{

    if(err){
      next(err);
    }
    else if(!user){
      res.render( './auth/auth-form', { errors: [info.message], isAuthenticated: req.isAuthenticated(), currentUser: req.user});
      console.log(user);
    }
    else{console.log( 'test314');
      req.login(user, (err)=>{
        console.log( 'test314');
          if(err){
            next(err)
          }
          else{
            res.redirect('/crikcroks');
          }
        }
      )
    }
  })(req, res, next);
}

exports.signout = (req, res, next) => {
    req.logout();
    res.redirect('/auth/signin/form');
}