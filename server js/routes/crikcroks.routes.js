const router = require('express').Router();
const {ensureAuthenticated} = require('../config/guards.config');
const { crikcrokList, crikcrokNew, crikcrokCreate,crikcrokDelete } = require('../controllers/crikcroks.controller');


router.get('/', crikcrokList);
router.get('/new',ensureAuthenticated, crikcrokNew);
router.post('/',ensureAuthenticated, crikcrokCreate);
router.delete('/:crikcrokId',ensureAuthenticated, crikcrokDelete);


module.exports = router;