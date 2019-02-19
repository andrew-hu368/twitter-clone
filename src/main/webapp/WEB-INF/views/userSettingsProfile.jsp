<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="./components/htmlHead.jsp" />
    <title>User Settings. Twitter</title>
  </head>
  <body>
    <jsp:include page="./components/navLoggedIn.jsp" />
    <main>
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <p>${user.username}</p>
          </div>
          <div class="col-lg-4">
            <h3>Account</h3>
            <form:form
              action="/twitter/users/${user.username}/profile"
              method="patch"
              modelAttribute="user"
            >
              <div class="form-group">
                <form:input
                  type="text"
                  value="${user.name}"
                  placeholder="Name"
                  class="form-control"
                  path="name"
                />
              </div>
              <div class="form-group">
                <form:input
                  type="email"
                  value="${user.email}"
                  class="form-control"
                  path="email"
                />
              </div>
              <div class="form-group">
                <form:textarea
                  value="${user.description}"
                  placeholder="Description"
                  rows="3"
                  class="form-control"
                  path="description"
                />
              </div>
              <div class="form-group">
                <form:input
                  type="text"
                  value="${user.location}"
                  placeholder="Location"
                  class="form-control"
                  path="location"
                />
              </div>
              <div class="form-group">
                <form:input
                  type="text"
                  value="${user.website}"
                  placeholder="Website"
                  class="form-control"
                  path="website"
                />
              </div>
              <button type="submit" class="btn btn-primary">Update</button>
            </form:form>
          </div>
          <div class="col-lg-4">
            C Twitter
          </div>
        </div>
      </div>
    </main>

    <jsp:include page="./components/htmlJSScript.jsp" />
  </body>
</html>
