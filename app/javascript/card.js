// window.addEventListener("load", function(){

  const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById(""); //イベント発火
    form.addEventListener("submit", (e) => {
      e.preventDefault();  //フォーム送信キャンセル

      const formResult = document.getElementById("");
      const formData = new FormData(formResult);
      //以下カード情報を変数に代入
      const card = {
        number: formData.get("number"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
      };
      //以下カード情報の値をパラメーターとして送信しないようにする
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById("");
          const tokenObj = `<input value=${token} type="hidden name='token'>`; //token情報、このオブジェクトによりパラメーターとして受け取れるようになる
          renderDom.insertAdjacentHTML("beforeend", tokenObj);

          document.getElementById("number").removeAttribute("name");
          document.getElementById("cvc").removeAttribute("name");
          document.getElementById("exp_month").removeAttribute("name");
          document.getElementById("exp_year").removeAttribute("name");
          // フォームの情報をサーバーサイドに送信
          document.getElementById("").submit();
          document.getElementById("").reset();
        } else {

        }
      });
    });
  };
// };

window.addEventListener("load", pay);  //pay関数が呼び出される