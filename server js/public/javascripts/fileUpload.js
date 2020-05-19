window.addEventListener('DOMContentLoaded',()=>{

  const input_recette = document.querySelector('#input_recette')
  const formContainer = document.querySelector('#formContainer')


  formContainer.addEventListener('click',(e)=>{
  console.log('clik')
  input_recette.click();
  })


  input_recette.addEventListener('change',(e)=>{
    formContainer.submit();
  })
})