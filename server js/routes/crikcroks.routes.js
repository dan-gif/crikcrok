const router = require('express').Router();
const { crikcrokList, crikcrokNew, crikcrokCreate,crikcrokDelete } = require('../controllers/crikcroks.controller');


router.get('/', crikcrokList);
router.get('/new',crikcrokNew);
router.post('/', crikcrokCreate);
router.delete('/:crikcrokId', crikcrokDelete);


module.exports = router;