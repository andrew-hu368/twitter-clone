<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Sign Up for Twitter</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
      crossorigin="anonymous"
    />
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
            <ul class="navbar-nav ml-auto">
              <li class="nav-item ml-lg-3">
                <a class="btn btn-primary" href="login">Log In</a>
              </li>
              <li class="nav-item ml-lg-3">
                <a class="btn btn-primary" href="signup">Sign Up</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <div class="container">
      <div class="w-75 mx-auto">
        <h3 class="mb-4">Create your account</h3>
        <form:form
          action="/twitter/users"
          method="POST"
          modelAttribute="user"
          id="signupForm"
        >
          <div class="form-group">
            <form:input
              type="text"
              placeholder="What's your user ID?"
              class="form-control"
              path="username"
            />
          </div>
          <div class="form-group">
            <form:input
              type="email"
              placeholder="What's your email?"
              class="form-control"
              path="email"
            />
          </div>
          <div class="form-group">
            <form:input
              id="password"
              type="password"
              placeholder="Password"
              class="form-control"
              path="password"
            />
            <div class="invalid-feedback"> </div>
          </div>
          <div class="form-group">
            <input
              id="confirmPassword"
              type="password"
              placeholder="Confirm your password"
              class="form-control"
              name="confirmPassword"
            />
          </div>
          <button type="submit" class="btn btn-primary" id="submitBtn"
            >Sign Up</button
          >
        </form:form>
      </div>
    </div>

    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
      integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
      crossorigin="anonymous"
    ></script>
    <script>
      const submitBtn = document.getElementById("submitBtn");
      const password = document.getElementById("password");
      const confirmPassword = document.getElementById("confirmPassword");

      function submitForm() {
        submitBtn.addEventListener("click", e => {
          e.preventDefault();

          if (password.value === confirmPassword.value) {
            const signupForm = document.getElementById("signupForm");
            console.log(signupForm);
            signupForm.submit();
          } else {
            const invalidFeedback = document.querySelector(".invalid-feedback");
            password.classList.add("is-invalid");
            confirmPassword.classList.add("is-invalid");
            invalidFeedback.innerHTML = "Passwords do not match.";
          }
        });
      }

      submitForm();
    </script>
  </body>
</html>
