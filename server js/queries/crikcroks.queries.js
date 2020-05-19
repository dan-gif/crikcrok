const Crikcrok =require('../database/models/crikcrok.model')

exports.getCrikcrok =()=> {
    console.log(Crikcrok.find({}).exec())
    
    return Crikcrok.find({}).exec();
}
exports.createCrikcrok =(crikcrok)=>{
    const newCrikcrok = new Crikcrok(crikcrok);
    return newCrikcrok.save();

}
exports.deleteCrikcrok=( crikcrokId)=>{
    return Crikcrok.findByIdAndDelete(crikcrokId).exec();
}

