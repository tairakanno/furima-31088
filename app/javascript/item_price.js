window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const itemFee = document.getElementById("add-tax-price");
    const itemProfit = document.getElementById("profit");

    // fee
    const fee = Math.floor(inputValue/10)
    itemFee.innerHTML = fee
    // profit 
    const profit = Math.floor(inputValue - fee)
    itemProfit.innerHTML = profit

  })
  
});


