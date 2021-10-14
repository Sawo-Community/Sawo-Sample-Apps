<template>
  <div class="containerStyle">
    <section>
      <h2 class="title">VUE | Sawo Form Example</h2>
      <h2 class="title">User Logged In : {{ isLoggedIn }}</h2>
      <div class="loggedin" v-if="isLoggedIn">
        <h2>User Successfull login</h2>
        <div>UserId: {{ userPayload.user_id }}</div>
        <div>Verification Token: {{ userPayload.verification_token }}</div>
      </div>
      <div class="formContainer" id="sawo-container" v-if="!isLoggedIn">
        <!-- Sawo form will populate here -->
      </div>
    </section>
  </div>
</template>

<script>
import Sawo from "sawo";

const API_KEY = process.env.VUE_APP_API_KEY;

// console.log(`Sawo, `, Sawo);
export default {
  name: "Sawo",
  data: () => ({
    isLoggedIn: false,
    userPayload: {},
    Sawo: null,
  }),
  mounted() {
    const sawoConfig = {
      // should be same as the id of the container
      containerID: "sawo-container",
      // can be one of 'email' or 'phone_number_sms'
      identifierType: "email",
      // Add the API key
      apiKey: API_KEY,
      // Add a callback here to handle the payload sent by sdk
      onSuccess: (payload) => {
        this.userPayload = payload;
        this.isLoggedIn = true;
        console.log("Payload : " + JSON.stringify(payload));
      },
    };
    // creating instance
    this.Sawo = new Sawo(sawoConfig);
    this.Sawo.showForm();
  },
};
</script>

<style scoped>
.containerStyle {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f9f9f9;
}

.sectionStyle {
  width: 500px;
  height: 400px;
  border: 1px;
  border-color: black;
}

.title {
  text-align: center;
  margin-bottom: 20px;
}

section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.formContainer {
  padding: 1rem;
  background-color: #f3f3f3;
  height: 300px;
  width: 400px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.loggedin {
  color: #155724;
  background-color: #d4edda;
  border-color: #c3e6cb;
  padding: 1rem;
}
</style>
