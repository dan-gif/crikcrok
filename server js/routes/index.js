const router = require('express').Router()
const crikcroks = require('./crikcroks.routes')
const users = require('./users.routes')
const auth = require('./auth.routes')


router.use('/users', users);
router.use('/auth', auth);
router.use('/crikcroks', crikcroks);
router.get('/', (req, res) => {
    res.redirect('/crikcroks')
});
module.exports = router;