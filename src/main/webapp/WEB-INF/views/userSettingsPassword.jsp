<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ page
isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="./components/htmlHead.jsp" />
    <title>Edit Password. Twitter</title>
  </head>
  <body>
    <jsp:include page="./components/navLoggedIn.jsp" />
    <main>
      <div class="container">
        <div class="row">
          <div class="col-lg-4">${activeUser.username}</div>
          <div class="col-lg-4">
            <h3>Password</h3>
            <c:if test="${isPasswordUpdated == true}">
              <div class="alert alert-success" role="alert"
                >Password was successfully updated</div
              >
            </c:if>
            <c:if test="${isPasswordUpdated == false}">
              <div class="alert alert-danger" role="alert"
                >Password was not updated</div
              >
            </c:if>
            <form
              action="/twitter/users/${activeUser.username}/password"
              method="POST"
              id="passwordForm"
            >
              <input type="hidden" name="_method" value="PATCH" />
              <div class="form-group">
                <input
                  type="password"
                  placeholder="Old password"
                  class="form-control"
                  name="oldPassword"
                />
              </div>
              <div class="form-group">
                <input
                  type="password"
                  placeholder="New Password"
                  class="form-control"
                  name="newPassword"
                  id="newPassword"
                />
              </div>
              <div class="form-group">
                <input
                  type="password"
                  placeholder="Confirm Password"
                  class="form-control"
                  id="confirmNewPassword"
                />
              </div>
              <button type="submit" class="btn btn-primary" id="submitBtn">
                Update
              </button>
            </form>
          </div>
          <div class="col-lg-4"></div>
        </div>
      </div>
    </main>
    <jsp:include page="./components/htmlJSScript.jsp" />
    <script>
      const newPassword = document.getElementById("newPassword");
      const confirmNewPassword = document.getElementById("confirmNewPassword");
      const submitBtn = document.getElementById("submitBtn");

      submitBtn.addEventListener("click", e => {
        e.preventDefault();

        if (newPassword.value === confirmNewPassword.value) {
          const passwordForm = document.getElementById("passwordForm");
          passwordForm.submit();
        } else {
          newPassword.classList.add("is-invalid");
          confirmNewPassword.classList.add("is-invalid");
          const divInvalidFeedback = document.createElement("div");
          const invalidTextNode = document.createTextNode(
            "Passwords do not match"
          );
          divInvalidFeedback.append(invalidTextNode);
          divInvalidFeedback.classList.add("invalid-feedback");
          newPassword.parentElement.append(divInvalidFeedback);
        }
      });
    </script>
  </body>
</html>
