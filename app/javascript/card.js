//window.addEventListener("load", function(){

  const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById('charge-form'); //イベント発火
    form.addEventListener("submit", (e) => {
      e.preventDefault();  //フォーム送信キャンセル

      const formResult = document.getElementById('charge-form');
      const formData = new FormData(formResult);
      //以下カード情報を変数に代入
      const card = {
        number: formData.get("card"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
      };
      
      //以下カード情報の値をパラメーターとして送信しないようにする
      Payjp.createToken(card, (status, response) => {
        
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById('charge-form');
          const tokenObj = `<input value=${token} type="hidden" name='token'>`; //token情報、このオブジェクトによりパラメーターとして受け取れるようになる
          console.log(tokenObj)
          renderDom.insertAdjacentHTML("beforeend", tokenObj);

          document.getElementById("card-number").removeAttribute("name");
          document.getElementById("card-cvc").removeAttribute("name");
          document.getElementById("card-exp-month").removeAttribute("name");
          document.getElementById("card-exp-year").removeAttribute("name");
          // フォームの情報をサーバーサイドに送信
          document.getElementById('charge-form').submit();
          document.getElementById('charge-form').reset();
        } else {
        }
      });
    });
  };
// };

window.addEventListener("load", pay);  //pay関数が呼び出される