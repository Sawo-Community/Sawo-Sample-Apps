import { Link } from "react-router-dom";
import logo from "../../assets/logo.jpg";

const Header = () => {
  return (
    <header>
      <div className="container">
        <nav
          className="navbar navbar-expand-lg navbar-light primary-menu"
          style={{ backgroundColor: "#fff" }}
        >
          <Link to="/" className="navbar-brand">
            <img className="navbar-logo" src={logo} alt="Logo" />
          </Link>
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div className="navbar-nav ml-auto">
              <Link to="/" className="nav-link active styling__nav__link">
                Home <span className="sr-only">(current)</span>
              </Link>

              <Link to="/" className="nav-link styling__nav__link">
                Pricing
              </Link>

              <Link to="/" className="nav-link styling__nav__link">
                Docs
              </Link>

              <Link to="/" className="nav-link styling__nav__link">
                Resources
              </Link>

              <Link to="/" className="nav-link styling__nav__link">
                Contact Us
              </Link>

              <Link to="/login" className="btn btn-warning">
                Login <i className="fa fa-sign-in" aria-hidden="true"></i>
              </Link>
            </div>
          </div>
        </nav>
      </div>
    </header>
  );
};

export default Header;
