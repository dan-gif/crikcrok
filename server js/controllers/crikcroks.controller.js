const {getCrikcrok , createCrikcrok, deleteCrikcrok, } =require('../queries/crikcroks.queries');
const path = require('path');
const multer= require('multer');
const upload = multer({ storage: multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, path.join( __dirname, '../public/images/recettes'))
    },
    filename: (req, file, cb) => {
      cb(null, `${ Date.now() }-${ file.originalname }`);
    }
  }) 
})


exports.crikcrokList = async(req, res, next)=>{
    try{
        const crikcroks = await getCrikcrok()
        
            res.render('crikcroks/crikcrok', { crikcroks, isAuthenticated: req.isAuthenticated(), currentUser: req.user});
    }catch(e) {
        next(e);
    }
}

exports.crikcrokNew = (req, res, next)=>{
    res.render('crikcroks/crikcrok-form',{crikcroks:{}, isAuthenticated: req.isAuthenticated(), currentUser: req.user });
}


exports.crikcrokCreate = async(req, res, next)=>{
    try{
        const body = req.body;
        await createCrikcrok({ ...body, author: req.user._id });
            res.redirect('/crikcroks');
    }catch(e){
        const errors = Object.keys(e.errors).map(key => e.errors[key].message);
            res.status(400).render('crikcroks/crikcrok-form', {errors, isAuthenticated: req.isAuthenticated(), currentUser: req.user });
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
exports.uploadImage = [

    upload.single('recettes'),
    
    async(req, res, next)=>{
        try{
            const crikcroks= req.crikcroks;
            crikcroks.recettes='/images/recettes/${req.file.fliename}';
            await crikcroks.save();

            res.redirect('/');
            
        }catch(e){
            next(e);
        }
    res.end()
}]
