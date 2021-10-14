import * as React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";

import { LandingPage } from "./components/LandingPage";
import Sawo from "react-native-sawo";

const Stack = createStackNavigator();

const App = () => (
  <NavigationContainer>
    <Stack.Navigator initialRouteName="Home">
      <Stack.Screen
        name="Home"
        component={LandingPage}
        options={{
          headerShown: false,
        }}
      />
      <Stack.Screen name="Login" component={Sawo} />
    </Stack.Navigator>
  </NavigationContainer>
);

export default App;
