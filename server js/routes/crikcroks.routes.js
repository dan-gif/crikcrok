const router = require('express').Router();
const {ensureAuthenticated} = require('../config/guards.config');
const { crikcrokList, crikcrokNew, crikcrokCreate,crikcrokDelete,uploadImage} = require('../controllers/crikcroks.controller');


router.get('/', crikcrokList);
router.get('/new',ensureAuthenticated, crikcrokNew);
router.post('/',ensureAuthenticated, crikcrokCreate);
router.delete('/:crikcrokId',ensureAuthenticated, crikcrokDelete);
router.post('/upload/image',ensureAuthenticated,uploadImage );

module.exports = router;