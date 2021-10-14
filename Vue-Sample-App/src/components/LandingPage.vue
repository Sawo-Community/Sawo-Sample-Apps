<template>
  <header>
    <div class="container">
      <nav
        class="navbar navbar-expand-lg navbar-light primary-menu"
        style="background-color: #fff"
      >
        <a class="navbar-brand" href="#">
          <img class="navbar-logo" src="../assets/logo.jpg" />
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarNavAltMarkup"
          aria-controls="navbarNavAltMarkup"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav ml-auto">
            <a
              class="nav-link active styling__nav__link"
              href=""
              target="_blank"
              >Home <span class="sr-only">(current)</span></a
            >
            <a class="nav-link styling__nav__link" href="" target="_blank"
              >Pricing</a
            >
            <a class="nav-link styling__nav__link" href="">Docs</a>
            <a class="nav-link styling__nav__link" href="">Resources</a>
            <a class="nav-link styling__nav__link" href="">Contact Us</a>
            <router-link to="/login" class="btn btn-warning"
              >Login <i class="fa fa-sign-in" aria-hidden="true"></i
            ></router-link>
          </div>
        </div>
      </nav>
    </div>
  </header>
  <main>
    <div class="heading">
      <h1>Product Headline</h1>
      <button class="btn btn-lg btn-warning mt-3 cta">
        <span>Call To Action</span>
      </button>
    </div>
    <div class="feature-cards row">
      <div class="col-xs-12 col-sm-6 col-md-4">
        <div class="card mb-4 mx-auto">
          <div class="card-body">
            <h5 class="card-title">Feature One</h5>
            <p class="card-text">
              Some quick example text to build on the card title and make up the
              bulk of the card's content.
            </p>
            <a href="#" class="btn btn-warning">Go somewhere</a>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-4">
        <div class="card mb-4 mx-auto">
          <div class="card-body">
            <h5 class="card-title">Feature Two</h5>
            <p class="card-text">
              Some quick example text to build on the card title and make up the
              bulk of the card's content.
            </p>
            <a href="#" class="btn btn-warning">Go somewhere</a>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-4">
        <div class="card mb-4 mx-auto">
          <div class="card-body">
            <h5 class="card-title">Feature Three</h5>
            <p class="card-text">
              Some quick example text to build on the card title and make up the
              bulk of the card's content.
            </p>
            <a href="#" class="btn btn-warning">Go somewhere</a>
          </div>
        </div>
      </div>
    </div>
  </main>
  <Footer />
</template>

<script>
import Footer from "./Footer.vue";
export default {
  name: "LandingPage",
  components: {
    Footer,
  },
};
</script>

<style>
.login {
  background-color: #ffa500;
  padding: 0.5rem;
}
.container {
  margin: 0;
  padding: 0;
  max-width: 100%;
  box-shadow: 0 8px 8px #888888;
}

body {
  background-image: url("../assets/bg.png");
  background-repeat: no-repeat;
  background-size: cover;
  overflow-x: hidden;
}
.nav {
  padding-left: 2rem !important;
  padding-right: 2rem !important;
}
.navbar-brand {
  width: 80px;
  height: 80px;
}

.navbar-logo {
  height: 100%;
  width: 100%;
}

main {
  height: 500px;
}
.heading {
  margin-top: 3rem;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
.cta {
  transition: all 0.5s;
}

.cta span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.cta span:after {
  content: "\00bb";
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.cta:hover span {
  padding-right: 25px;
}

.cta:hover span:after {
  opacity: 1;
  right: 0;
}

.feature-cards {
  margin-top: 5rem;
  margin-bottom: 5rem;
  margin-left: 3rem;
  margin-right: 3rem;
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}

.card {
  margin-right: 3rem;
}
</style>
