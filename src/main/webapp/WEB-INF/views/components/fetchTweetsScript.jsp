<script>
  (function() {
    fetchUserTweetFeeds();
    loadMorePostOnWindowScroll();

    function fetchUserTweetFeeds() {
      fetch("/twitter/users/${activeUser.username}/tweets")
        .then(res => {
          return res.json();
        })
        .then(data => {
          data.forEach(el => {
            insertTweetsInContainer(el);
          });
        });
    }

    function insertTweetsInContainer(el) {
      const tweetCol = document.getElementById("tweetsCol");
      const divCard = document.createElement("div");
      const divCardBody = document.createElement("div");
      const h6CardTitle = document.createElement("h6");
      const cardTitleTextNode = document.createTextNode(el[4]);
      const cardBodyTextNode = document.createTextNode(el[2]);
      divCard.classList.add("card");
      divCard.classList.add("mt-3");
      h6CardTitle.classList.add("card-title");
      divCardBody.classList.add("card-body");
      h6CardTitle.appendChild(cardTitleTextNode);
      divCardBody.appendChild(h6CardTitle);
      divCardBody.appendChild(cardBodyTextNode);
      divCard.appendChild(divCardBody);
      tweetCol.appendChild(divCard);
    }

    function loadMorePostOnWindowScroll() {
      window.addEventListener("scroll", e => {
        const bodyTotalHeight = getBodyTotalHeight();
        const windowInnerHeight = getWindowInnerHeight();
        const windowScrollY = getWindowScrollY();

        if (windowInnerHeight + windowScrollY >= bodyTotalHeight) {
          fetchUserTweetFeeds();
        }
      });
    }

    function getBodyTotalHeight() {
      return document.body.offsetHeight;
    }

    function getWindowInnerHeight() {
      return window.innerHeight;
    }

    function getWindowScrollY() {
      return window.scrollY;
    }
  })();
</script>
