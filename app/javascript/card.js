const pay = () => {
  Payjp.setPublicKey("pk_test_919bef7565d742936e6e4595");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_item[order[number]]"),
      exp_month: formData.get("purchase_item[order[exp_month]]"),
      exp_year: `20${formData.get("purchase_item[order[exp_year]]")}`,
      cvc: formData.get("purchase_item[order[cvc]]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purchase_item[order[number]]").removeAttribute("name");
      document.getElementById("purchase_item[order[exp_month]]").removeAttribute("name");
      document.getElementById("purchase_item[order[exp_year]]").removeAttribute("name");
      document.getElementById("purchase_item[order[cvc]]").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);