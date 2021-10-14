# Node.js Sample App

Sample Node.js App integrating SAWO for authentication

# Instructions for Getting Started

- Install **`express`** by running

```bash
npm install express
```

- Make some endpoints in **`index.js`** file and serve your html files

```javascript
const express = require("express");
const app = express();

const path = require("path");
app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.get("/login", (req, res) => {
  res.sendFile(__dirname + "/public/login.html");
});

app.get("/success", (req, res) => {
  res.sendFile(__dirname + "/public/success.html");
});

app.listen("3000", console.log("Listening on port 3000."));
```

- The body of the login page should look like this for showing the SAWO login form

```html
<body>
  <div id="sawo-container" style="height: 300px; width: 300px"></div>

  <script src="https://websdk.sawolabs.com/sawo.min.js"></script>
  <script>
    // Fetching payload from sessionStorage
    const payload = sessionStorage.getItem("payload");
    if (payload) {
      // If the payload is available, that means the user has logged in already.
      // So redirecting back to "/login"
      window.location.href = "/success";
    }
    var config = {
      // should be same as the id of the container created on 3rd step
      containerID: "sawo-container",
      // can be one of 'email' or 'phone_number_sms'
      identifierType: "email",
      // Add the API key copied from 2nd step
      apiKey: "Your API Key",
      // Add a callback here to handle the payload sent by sdk
      onSuccess: (payload) => {
        // Storing the payload in sessionStorage
        sessionStorage.setItem("payload", JSON.stringify(payload));
        // Redirecting to "/success"
        window.location.href = "/success";
      },
    };
    var sawo = new Sawo(config);
    sawo.showForm();
  </script>
</body>
```

- You can store the payload to the sessionStorage and can take actions according to that
- Demo body for the success.html file

```html
<body>
  <h2 id="login" style="text-align: center">
    You Have Logged In Successfully !
  </h2>

  <script>
    // Fetching payload from sessionStorage
    const payload = sessionStorage.getItem("payload");
    // Checking if the payload is available or not
    if (payload) {
      // If the payload is available then console.log the payload
      console.log("Payload : " + payload);
    } else {
      // If the payload isn't available, that means the user hasn't logged in yet.
      // So redirecting back to "/login"
      window.location.href = "/login";
    }
  </script>
</body>
```

### Feel free to add your own styling and elements
