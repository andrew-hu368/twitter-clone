<script>
  (function() {
    const followBtns = document.querySelectorAll(".btn-sm");
    followBtns.forEach(btn => {
      btn.addEventListener("click", e => {
        e.preventDefault();

        if (e.target.innerText === "Follow") {
          followUser(e);
        }

        if (
          e.target.innerText === "Following" ||
          e.target.innerText === "Unfollow"
        ) {
          unfollowUser(e);
        }
      });

      if (btn.innerText === "Following") {
        followingBtnListener(btn);
      }
    });

    function followUser(e) {
      fetch("/twitter/users/${activeUser.username}/followees", {
        headers: new Headers({
          "Content-Type": "application/json"
        }),
        method: "POST",
        body: JSON.stringify({
          username: e.target.dataset.username,
          followeeId: e.target.dataset.followeeId
        })
      })
        .then(res => {
          onPOSTSuccess(e);
        })
        .catch(err => {
          onError(err);
        });
    }

    function unfollowUser(e) {
      fetch("/twitter/users/${activeUser.username}/followees", {
        headers: new Headers({
          "Content-Type": "application/json"
        }),
        method: "DELETE",
        body: JSON.stringify({
          username: e.target.dataset.username,
          followeeId: e.target.dataset.followeeId
        })
      })
        .then(res => {
          onDELETESuccess(e);
        })
        .catch(err => {
          onError(err);
        });
    }

    function onPOSTSuccess(e) {
      const btn = e.target;
      btn.innerText = "Following";
      followingBtnListener(btn);
    }

    function onDELETESuccess(e) {
      let btn = e.target;
      btn.innerText = "Follow";
      btn.removeEventListener("mouseover", toUnfollowAnimation);
      btn.removeEventListener("mouseout", toFollowingAnimation);
      btn.classList.remove("btn-danger");
      btn.classList.add("btn-primary");
    }

    function onError(err) {
      const container = document.querySelector(".container");
      const errorDiv = document.createElement("div");
      const textError = document.createTextNode(err);

      errorDiv.appendChild(textError);
      container.classList.add("alert");
      container.classList.add("alert-danger");

      container.prepend(errorDiv);
    }

    function followingBtnListener(btn) {
      btn.addEventListener("mouseover", toUnfollowAnimation);
      btn.addEventListener("mouseout", toFollowingAnimation);
    }

    function toUnfollowAnimation(e) {
      const btn = e.target;
      btn.classList.remove("btn-primary");
      btn.classList.add("btn-danger");
      btn.textContent = "Unfollow";
    }

    function toFollowingAnimation(e) {
      const btn = e.target;
      btn.classList.remove("btn-danger");
      btn.classList.add("btn-primary");
      btn.textContent = "Following";
    }
  })();
</script>
