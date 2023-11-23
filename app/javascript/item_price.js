window.addEventListener('turbo:load', () => {
  console.log("OK");
});

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const taxValue = addTaxDom.value;

  const profitElement = document.getElementById("profit");
  profitElement.innerHTML = Math.floor(inputValue - taxValue);
    const profitValue = profitElement.value;
  console.log(profitValue);
})