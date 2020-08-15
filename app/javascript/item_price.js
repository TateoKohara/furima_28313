window.addEventListener("load", function(){
  
  const price_field = document.getElementById("item-price");
  price_field.addEventListener("input", function(){
  
    let price = this.value;
    let fee = price / 10;
    let benefit = price - fee;

    const fee_field = document.getElementById("add-tax-price")
    fee_field.textContent = fee;
    
    const profit_field = document.getElementById("profit")
    profit_field.textContent = benefit;
    
  })
})