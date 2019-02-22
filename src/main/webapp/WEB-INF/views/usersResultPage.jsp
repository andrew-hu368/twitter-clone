<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="./components/htmlHead.jsp" />
    <title>Result page for ${terms}</title>
  </head>
  <body class="bg-light">
    <jsp:include page="./components/navLoggedIn.jsp" />
    <main>
      <section id="searchTerms" class="bg-primary text-white py-2">
        <div class="container">
          <h2>${terms}</h2>
        </div>
      </section>
      <section id="searchResults">
        <div class="container">
          <div class="row">
            <c:forEach items="${users}" var="user">
              <div class="col-lg-3 bg-white mt-4 mx-3 p-3">
                <div class="clearfix">
                  <h5 class="float-left">${user[0]}</h5>
                  <c:if test="${activeUser.username != user[0]}">
                    <button
                      class="btn btn-sm btn-primary float-right"
                      data-username="${activeUser.username}"
                      data-followee-id="${user[0]}"
                    >
                      <c:choose>
                        <c:when test="${user[3] == activeUser.username }">
                          Following
                        </c:when>
                        <c:otherwise>
                          Follow
                        </c:otherwise>
                      </c:choose>
                    </button>
                  </c:if>
                </div>
                <div>${user[2]}</div>
              </div>
            </c:forEach>
          </div>
        </div>
      </section>
    </main>
    <jsp:include page="./components/htmlJSScript.jsp" />
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
  </body>
</html>
