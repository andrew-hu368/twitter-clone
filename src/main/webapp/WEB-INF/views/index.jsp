<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="./components/htmlHead.jsp" />
    <title>Twitter. It's what's happening</title>
  </head>
  <body>
    <div style="height: 100vh;" class="d-flex flex-column">
      <main class="flex-grow-1" style="height: 100%; overflow: hidden;">
        <div class="row" style="height: 100%;">
          <div class="col-lg-6" style="height: 100%">
            <div
              class="d-flex justify-content-center align-items-center flex-column"
              style="height: 100%;"
            >
              <div>
                <div class="mt-lg-5">
                  <i class="fas fa-search pr-3"></i> Follow your interests.
                </div>
                <div class="mt-lg-5">
                  <i class="fas fa-users pr-3"></i> Hear what people are talking
                  about.
                </div>
                <div class="mt-lg-5">
                  <i class="far fa-comment pr-3"></i> Join the conversation.
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6" style="height: 100%; position: relative">
            <!-- Inline form -->
            <div
              class="mt-3 d-lg-block d-none"
              style="width: 100%; position:absolute;"
            >
              <form
                action="users/login"
                method="POST"
                class="form-inline d-flex justify-content-center"
              >
                <div class="form-group mr-3">
                  <input
                    type="text"
                    id="credentials"
                    name="userCredential"
                    class="form-control"
                    placeholder="Email or ID"
                  />
                </div>
                <div class="form-group mr-3">
                  <input
                    type="password"
                    name="password"
                    id="password"
                    class="form-control"
                    placeholder="Password"
                  />
                </div>
                <button type="submit" class="btn btn-primary">Log in</button>
              </form>
            </div>
            <div
              style="width: 70%; height: 100%; margin: 0 auto;"
              class="d-flex flex-column justify-content-center"
            >
              <!-- Heading primary -->
              <div>
                <div>
                  <i class="fab fa-twitter mb-2" style="font-size: 2rem"></i>
                </div>
                <h2>See what's happening in the world right now</h2>
              </div>
              <!-- Heading Secondary -->
              <div class="mt-5">
                <h6>Join Twitter today.</h6>
              </div>
              <!-- Sign up button -->
              <div class="mt-3">
                <a
                  href="/twitter/users/signup"
                  class="btn btn-primary btn-block"
                  >Sign up</a
                >
              </div>
              <!-- Log in button -->
              <div class="mt-3">
                <a href="/twitter/users/login" class="btn btn-primary btn-block"
                  >Log in</a
                >
              </div>
            </div>
          </div>
        </div>
      </main>
      <footer>
        <div
          class="d-flex justify-content-center small bg-light text-secondary pt-3"
        >
          <ul class="list-inline">
            <li class="list-inline-item">About</li>
            <li class="list-inline-item">Help Centre</li>
            <li class="list-inline-item">Blog</li>
            <li class="list-inline-item">2019 Twitter, Inc.</li>
          </ul>
        </div>
      </footer>
    </div>

    <jsp:include page="./components/htmlJSScript.jsp" />
  </body>
</html>
