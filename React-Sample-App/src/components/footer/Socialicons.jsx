import { Link } from "react-router-dom";
import "./Footer.css";

const Socialicons = ({ src, alt }) => {
  return (
    <Link to="/" className="social-link">
      <img src={src} alt={alt} className="img-fluid" />
    </Link>
  );
};

export default Socialicons;
