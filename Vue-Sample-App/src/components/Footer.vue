<template>
  <footer>
    <div class="Footer_container__8-0SY container styling__footer__container">
      <div class="container-lg row">
        <div class="col-md-4 col-sm-6 col-lg-4 col-xs-12">
          <div class="footer-columns">
            <div class="footer-column">
              <h6>Support</h6>
              <p>
                To get in touch with us <br />write to us at <br /><b
                  ><a
                    style="color: rgb(255, 255, 255) !important"
                    href="mailto:contact@product.com"
                    >contact@product.com</a
                  ></b
                >
              </p>
              <br />
              <p>
                Or speak to our customer<br />representative
                <button class="btn btn-md btn-warning">
                  <b>chatbot</b>
                </button>
                <br />
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 col-lg-4 col-xs-12">
          <div class="footer-columns">
            <div class="footer-column quick-links">
              <h6>Quick Links</h6>
              <div class="col-6">
                <ul>
                  <li>
                    <a href="/pricing/#faqs">FAQs</a>
                  </li>
                  <li><a href="/pricing">Pricing</a></li>
                  <li>
                    <a href="" target="_blank" rel="noopener noreferrer"
                      >Docs</a
                    >
                  </li>
                  <li>
                    <a href="/resources">Resources</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="footer-column my-2">
              <br />
              <div class="col-md-12">
                <ul>
                  <li><a href="/careers">Careers</a></li>
                  <li>
                    <a href="" target="_blank" rel="noopener noreferrer"
                      >Community</a
                    >
                  </li>
                  <li>
                    <a
                      href="/privacy-policy"
                      target="_blank"
                      rel="noopener noreferrer"
                      >Privacy Policy</a
                    >
                  </li>
                  <li>
                    <a href="" target="_blank" rel="noopener noreferrer"
                      >Sponsorship Program</a
                    >
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-lg-3 col-xs-12 my-2">
          <div class="social-links">
            <p>Follow Us</p>
            <a
              href=""
              class="social-link"
              target="_blank"
              rel="noopener noreferrer"
              ><img
                src="../assets/SM-LinkedIn.svg"
                alt="linkedin logo"
                class="img-fluid"
            /></a>
            <a
              href=""
              class="social-link"
              target="_blank"
              rel="noopener noreferrer"
              ><img
                src="../assets/SM-Instagram.svg"
                alt="instagram logo"
                class="img-fluid"
            /></a>
            <a
              href=""
              class="social-link"
              target="_blank"
              rel="noopener noreferrer"
              ><img
                src="../assets/SM-Facebook.svg"
                alt="facebook logo"
                class="img-fluid"
            /></a>
            <a
              href=""
              class="social-link"
              target="_blank"
              rel="noopener noreferrer"
              ><img
                src="../assets/SM_Twitter.svg"
                alt="TwitterLogo"
                class="img-fluid"
            /></a>
            <a
              href=""
              class="social-link"
              target="_blank"
              rel="noopener noreferrer"
              ><img
                src="../assets/SM-GitHub.svg"
                alt="facebook logo"
                class="img-fluid"
            /></a>
          </div>
          <br />
        </div>
      </div>
      <br />
      <hr class="horizontal-row" />
      <div class="row mt-5">
        <div class="col-12 text-center">
          <p>All Rights Reserved | © Sawo Labs 2021</p>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: "Footer",
};
</script>

<style >
footer {
  background-image: url("../assets/footerbg.png");
  background-repeat: no-repeat;
  background-size: cover;
}

.footer-columns {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-top: 150px;
  color: #fff;
}

footer a {
  color: #ffa500 !important;
}

footer h3 {
  color: #ffa500 !important;
}
.social-links {
  padding-top: 130px;
  color: #fff;
  width: 250px;
}

.social-links img {
  margin-right: 5px;
}

@media only screen and (max-width: 1000px) {
  footer {
    padding-top: 400px;
  }
}
</style>