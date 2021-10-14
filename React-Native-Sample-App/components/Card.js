import React from "react";
import { StyleSheet, View, Text, TouchableOpacity } from "react-native";

const Card = ({ title }) => {
  return (
    <View style={styles.card}>
      <Text
        style={{
          fontSize: 20,
          fontWeight: "bold",
        }}
      >
        {title}
      </Text>
      <Text
        style={{
          fontSize: 16,
          marginVertical: 5,
        }}
      >
        Some quick example text to build on the card title and make up the bulk
        of the card's content.
      </Text>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttontext}>Go Somewhere</Text>
      </TouchableOpacity>
    </View>
  );
};

export { Card };

const styles = StyleSheet.create({
  card: {
    backgroundColor: "#fff",
    alignSelf: "stretch",
    marginHorizontal: 30,
    marginVertical: 10,
    paddingHorizontal: 20,
    paddingVertical: 15,
    borderRadius: 5,
  },
  button: {
    backgroundColor: "#ffc107",
    width: 150,
    paddingVertical: 8,
    alignItems: "center",
    justifyContent: "center",
    borderRadius: 5,
    marginTop: 10,
  },
  buttontext: {
    color: "#000",
    fontSize: 16,
    fontWeight: "600",
  },
});
