const calc = () => {
  const itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener("input", () => {
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    const priceVal = itemPrice.value;
    const taxVal = Math.floor(priceVal * 0.1);
    const profitVal = Math.floor(priceVal - taxVal);
    
    tax.innerHTML = taxVal.toLocaleString();
    profit.innerHTML = profitVal.toLocaleString();
  })

  if(itemPrice && itemPrice.value != ''){
    const event = new Event("input");
    itemPrice.dispatchEvent(event);
  }
}
window.addEventListener("turbo:load", calc);
document.addEventListener("turbo:render", calc);

