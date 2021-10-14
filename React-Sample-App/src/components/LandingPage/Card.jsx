import { Link } from "react-router-dom";
import "./LandingPage.css";

const Card = ({ title }) => {
  return (
    <div className="col-xs-12 col-sm-6 col-md-4">
      <div className="card mb-4 mx-auto">
        <div className="card-body">
          <h5 className="card-title">{title}</h5>
          <p className="card-text">
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>

          <Link to="/" className="btn btn-warning">
            Go somewhere
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Card;
