const {getCrikcrok , createCrikcrok, deleteCrikcrok, } =require('../queries/crikcroks.queries');


exports.crikcrokList = async(req, res, next)=>{
    try{
        const crikcroks = await getCrikcrok()
        
            res.render('crikcroks/crikcrok', { crikcroks, isAuthenticated: req.isAuthenticated(), currentUser: req.user});
    }catch(e) {
        next(e);
    }
}

exports.crikcrokNew = (req, res, next)=>{
    res.render('crikcroks/crikcrok-form');
}

exports.crikcrokCreate = async(req, res, next)=>{
    try{
        const body = req.body;
        await createCrikcrok(body);
            res.redirect('/crikcroks');
    }catch(e){
        const errors = Object.keys(e.errors).map(key => e.errors[key].message);
            res.status(400).render('crikcroks/crikcrok-form', {errors});
    }
}
exports.crikcrokDelete= async(req, res, next)=>{
    try{
        const crikcrokId = req.params.crikcrokId;
        await deleteCrikcrok(crikcrokId);
        const crikcroks = await  getCrikcrok();
        res.render('crikcroks/crikcrok-list', { crikcroks });
    }catch(e) {
        next(e);
    }
}
