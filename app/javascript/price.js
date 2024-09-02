const calc = () => {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")

    const priceVal = itemPrice.value
    const taxVal = Math.round(priceVal * 0.1)
    const profitVal = priceVal - taxVal 
    
    tax.innerHTML = taxVal.toLocaleString()
    profit.innerHTML = profitVal.toLocaleString()

  })
}
window.addEventListener("turbo:load", calc)