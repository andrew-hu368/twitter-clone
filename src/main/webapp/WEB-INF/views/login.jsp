<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<jsp:include page="./components/htmlHead.jsp" />
    <title>Log in to Twitter</title>
  </head>
  <body>
    <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
        <div class="container">
          <a class="navbar-brand" href="/twitter"
            ><i class="fab fa-twitter text-primary"></i
          ></a>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item ml-lg-3">
                <a class="nav-link" href="/twitter/">Home</a>
              </li>
              <li class="nav-item ml-lg-3">
                <a class="nav-link" href="/twitter/about">About</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <div class="container">
      <div class="border">
        <div class="w-75 mx-auto">
          <h3 class="my-4">Log in to Twitter</h3>
          <form action="/twitter/users/login" method="POST" class="mb-3">
            <div class="form-group">
              <input
                type="text"
                class="form-control <c:if test="${isLoggedIn == false}">is-invalid</c:if>"
                placeholder="Email or username"
                name="userCredential"
              />
              <c:if test="${isLoggedIn == false}">
              	<div class="invalid-feedback">Account or password is not valid</div>
              </c:if>
            </div>
            <div class="form-group">
              <input
                type="password"
                class="form-control <c:if test="${isLoggedIn == false}">is-invalid</c:if>"
                placeholder="Password"
                name="password"
              />
            </div>
            <button type="submit" class="btn btn-primary mt-3">Log In</button>
          </form>
        </div>
        <div class="bg-light">
          <div class="w-75 mx-auto pt-3 pb-2">
            <p>
              New to Twitter? <a href="/twitter/users/signup">Sign up now</a>
            </p>
          </div>
        </div>
      </div>
    </div>

	<jsp:include page="./components/htmlJSScript.jsp" />
  </body>
</html>
