const { app } = require('../app');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const { findUserPerPseudo, findUserPerId } = require('../queries/users.queries');

app.use(passport.initialize()); // initialisation obligatoire
app.use(passport.session()); // utilisation des sessions avec passport

// Après l'authentification nous ne stockons que l'_id du user
// dans la session pour ne pas la surcharger
passport.serializeUser((user, done) => {
  done(null, user._id);
})

// A chaque requête, la session est récupérée par express-session en utilisant
// l'id de la session dans le cookie. Passport récupère l'_id du user dans la session
// et exécute cette méthode. Nous récupérons le user avec son _id et le retournons
// à Passport avec done(null, user). Passport le mettra alors sur req.user
passport.deserializeUser(async (id, done) => {console.log('test2')
  try {
    const user = await findUserPerId(id);
    done(null, user)
  } catch(e) {
    done(e);
    console.log('test3')
  }
})

// Configuration de la stratégie locale
// Nous utilisons l'email comme identifiant et devons donc passer
// l'option usernameField

passport.use('local', new LocalStrategy({
  usernameField: 'pseudo'
}, async (pseudo, password, done) => {console.log('test1')
  try {console.log('test53')
      // Nous essayons de récupérer l'utilisateur avec son email
    const user = await findUserPerPseudo(pseudo);
    if (user) {console.log('testb')
      // Si nous le retrouvons nous comparons le mot de passe hashé de la bdd
      // avec le hash du mot de passe fourni par l'utilisateur
      const match = await user.comparePassword(password);
      if (match) {console.log('testa')
        // Si ça match alors le mot de passe est correct
        done(null, user);
      } else {console.log('testC')
        // Si les hash ne matchent pas, le mot de passe rentré n'est
        // pas le bon et nous retournons une erreur
        done(null, false, { message: 'Wrong password' });
      }
    } else {
      // Si nous n'avons pas de user, nous retournons une erreur
      console.log('tets5')
      done(null, false, { message: 'User not found'});
    }
  } catch(e) {
    done(e);
  }
}))