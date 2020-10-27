const pay = () => {
  Payjp.setPublicKey("pk_test_35c1ab4d8eb1c30cb6ac6601");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("purchase_record_shipping_address[card-number]"),
      exp_month: formData.get("purchase_record_shipping_address[card-exp-month]"),
      exp_year: `20${formData.get("purchase_record_shipping_address[card-exp-year]")}`,
      cvc: formData.get("purchase_record_shipping_address[card-cvc]"),
    };
    console.log(card)
 
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);