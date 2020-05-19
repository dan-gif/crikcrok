window.addEventListener('DOMContentLoaded',()=>{

  const recettes = document.querySelector('#recettes')
  const formContainer = document.querySelector('#formContainer')


  formContainer.addEventListener('click',(e)=>{
  recettes.click();
  })


recettes.addEventListener('change',(e)=>{
    formContainer.submit();
  })
})