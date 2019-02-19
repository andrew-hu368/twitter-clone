<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="./components/htmlHead.jsp" />
    <title>Twitter</title>
  </head>
  <body>
    <jsp:include page="./components/navLoggedIn.jsp" />
    <main>
      <div class="container">
        <h1>You are logged in!</h1>
        <div class="row">
          <div class="col-lg-4">
            <h6>${activeUser.name}</h6>
            <div class="text-muted">@${activeUser.username}</div>
            <div class="row mt-3">
              <div class="col-6">
                <h6 class="text-muted">Tweet</h6>
                <p class="text-primary">0</p>
              </div>
              <div class="col-6">
                <h6 class="text-muted">Following</h6>
                <p class="text-primary">0</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4"></div>
          <div class="col-lg-4"></div>
        </div>
      </div>
    </main>

    <jsp:include page="./components/htmlJSScript.jsp" />
  </body>
</html>
