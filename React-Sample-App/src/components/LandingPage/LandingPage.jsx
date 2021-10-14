import Header from "../Header/Header";
import Card from "./Card";
import Footer from "../Footer/Footer";
import "./LandingPage.css";

const LandingPage = () => {
  return (
    <div className="landingMain">
      <Header />
      <main>
        <div className="heading">
          <h1>Product Headline</h1>
          <button className="btn btn-lg btn-warning mt-3 cta">
            <span>Call To Action</span>
          </button>
        </div>
        <div className="feature-cards row">
          <Card title="Feature One" />
          <Card title="Feature Two" />
          <Card title="Feature Three" />
        </div>
      </main>
      <Footer />
    </div>
  );
};

export default LandingPage;
