window.addEventListener('DOMContentLoaded',()=>{
    bindCrik()
 
})

function bindCrik(){
    const elements=document.querySelectorAll('.btn-danger');
    const crikcrokContainer=document.querySelector('crikcrok-list-container')

    elements.forEach(e=>{
        e.addEventListener('click', ($event)=>{
            const crikcrokId =$event.target.getAttribute('crikcrokid');
            console.log(crikcrokId);
            axios.delete('/crikcroks/'+ crikcrokId)
                 .then(function(response){
                    crikcrokContainer.innerHTML=response.data;
                    bindCrik();
                 })
                 .catch(function(err){console.log(err)});

        })
    })
}