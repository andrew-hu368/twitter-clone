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
    <jsp:include page="./components/followUserScript.jsp" />
  </body>
</html>
