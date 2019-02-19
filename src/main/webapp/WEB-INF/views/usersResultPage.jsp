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
                  <button
                    class="btn btn-sm btn-primary float-right"
                    data-username="${activeUser.username}"
                    data-followee-id="${user[0]}"
                  >
                    <c:choose>
                      <c:when test="${user[3] != null}">
                        Following
                      </c:when>
                      <c:otherwise>
                        Follow
                      </c:otherwise>
                    </c:choose>
                  </button>
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
      const followBtns = document.querySelectorAll(".btn-sm");
      followBtns.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();

          if (e.target.innerText === "Follow") {
            postFollowee(e);
          }
        });

        if (btn.textContent.trim() === "Following") {
          btn.addEventListener("mouseover", e => {
            btn.classList.remove("btn-primary");
            btn.classList.add("btn-danger");
            btn.textContent = "Unfollow";
          });
          btn.addEventListener("mouseout", e => {
            btn.classList.remove("btn-danger");
            btn.classList.add("btn-primary");
            btn.textContent = "Following";
          });
        }
      });

      function postFollowee(e) {
        console.log(e.target.dataset);
        fetch("/twitter/users/${activeUser.username}/followees", {
          headers: new Headers({
            "Content-Type": "application/json"
          }),
          method: "POST",
          body: JSON.stringify({username: e.target.dataset.username, followeeId: e.target.dataset.followeeId})
        })
          .then(function(response) {
            console.log(response.json());
          })
          .catch(err => {
            console.log(err);
          });
      }
    </script>
  </body>
</html>
