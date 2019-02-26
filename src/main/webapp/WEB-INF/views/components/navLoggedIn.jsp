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
        </ul>

        <form class="form-inline" action="/twitter/search" method="GET">
          <input
            class="form-control"
            type="search"
            placeholder="Search on Twitter"
            aria-label="Search on Twitter"
            name="terms"
          />
        </form>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown ml-3">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <i class="fas fa-user"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a
                class="dropdown-item"
                href="/twitter/users/${activeUser.username}/settings/profile"
                >Edit Profile</a
              >
              <a
                class="dropdown-item"
                href="/twitter/users/${activeUser.username}/settings/password"
                >Edit Password</a
              >
              <a class="dropdown-item" href="/twitter/users/logout">Log out</a>
            </div>
          </li>

          <li class="nav-item ml-3">
            <button class="btn btn-primary" id="tweetBtn">Tweet</button>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>
