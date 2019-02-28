<script>
  (function() {
    const cardContainer = document.getElementById("cardContainer");
    const tweetBtn = document.getElementById("tweetBtn");
    const closeTweetFormBtn = document.getElementById("closeTweetFormBtn");
    const tweetForm = document.getElementById("tweetForm");

    tweetFormBtnEventListener();
    tweetFormEventListener();

    function tweetFormEventListener() {
      tweetForm.addEventListener("submit", e => {
        const tweetContent = document.getElementById("tweetContent");
        e.preventDefault();

        fetch("/twitter/tweets/", {
          headers: new Headers({
            "Content-Type": "application/json"
          }),
          method: "POST",
          body: JSON.stringify({
            username: "${activeUser.username}",
            tweetContent: tweetContent.value
          })
        })
          .then(res => {
            cardContainer.classList.remove("d-block");
            cardContainer.classList.add("d-none");
            tweetContent.value = "";
          })
          .catch(err => {
            console.log(err);
          });
      });
    }

    function tweetFormBtnEventListener() {
      tweetBtn.addEventListener("click", e => {
        const isCardDisplayed = cardContainer.classList.contains("d-block");
        e.preventDefault();
        if (!isCardDisplayed) {
          cardContainer.classList.remove("d-block");
          cardContainer.classList.add("d-block");
        } else {
          cardContainer.classList.remove("d-block");
          cardContainer.classList.add("d-none");
        }
      });

      closeTweetFormBtn.addEventListener("click", e => {
        e.preventDefault();
        const isCardDisplayed = cardContainer.classList.contains("d-block");
        if (isCardDisplayed) {
          cardContainer.classList.remove("d-block");
          cardContainer.classList.add("d-none");
        }
      });
    }
  })();
</script>
