import React from "react";
import {
  StyleSheet,
  SafeAreaView,
  View,
  Text,
  TouchableOpacity,
  ScrollView,
  Image,
} from "react-native";

import { Card } from "./Card";
import { Footer } from "./Footer";

import logo from "../assets/images/logo.jpg";
import bg from "../assets/images/bg.png";

const LandingPage = ({ navigation }) => {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Image source={logo} style={styles.logo} />
        <Text style={styles.name}>SAWO React Native{"\n"}Example App</Text>
      </View>
      <ScrollView>
        <View style={styles.main}>
          <Image source={bg} style={styles.backgroundImage} />
          <Text style={styles.headline}>Product Headline</Text>
          <TouchableOpacity
            style={styles.button}
            onPress={() => {
              navigation.push("Login", {
                apiKey: "98beac36-0af2-4397-8e36-3b8ca9d41cdb",
                secretKey: "610055a05c10ecd04805628bV06sy8T2mKwcTFikaIgJViFW",
                identifierType: "phone_number_sms", // email | phone_number_sms,
                callback: (data) => {
                  console.log(data);
                },
              });
            }}
          >
            <Text style={styles.buttontext}>Login</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.button}>
            <Text style={styles.buttontext}>Call To Action</Text>
          </TouchableOpacity>
          <Card title="Feature One" />
          <Card title="Feature Two" />
          <Card title="Feature Three" />
          <Footer />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export { LandingPage };

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "flex-start",
    alignSelf: "stretch",
    marginTop: 25,
  },
  header: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingVertical: 15,
    paddingHorizontal: 20,
    alignSelf: "stretch",
  },
  logo: {
    height: 55,
    width: 55,
  },
  name: {
    marginRight: 60,
    fontSize: 20,
    fontWeight: "bold",
    textAlign: "center",
  },
  main: {
    justifyContent: "flex-start",
    alignItems: "center",
    alignSelf: "stretch",
    flex: 1,
  },
  backgroundImage: {
    position: "absolute",
    top: 0,
    left: 0,
    resizeMode: "cover",
  },
  headline: {
    fontSize: 30,
    fontWeight: "700",
    marginTop: 20,
    marginBottom: 10,
  },
  button: {
    backgroundColor: "#ffc107",
    height: 43,
    width: 145,
    marginVertical: 8,
    alignItems: "center",
    justifyContent: "center",
    borderRadius: 10,
  },
  buttontext: {
    color: "#000",
    fontSize: 18,
    fontWeight: "600",
  },
});
