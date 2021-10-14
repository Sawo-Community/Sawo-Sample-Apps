import { createWebHistory, createRouter } from "vue-router";
import LandingPage from "@/components/LandingPage.vue";
import Sawo from "@/components/Sawo.vue";

const routes = [
  {
    path: "/",
    name: "LandingPage",
    component: LandingPage,
  },
  {
    path: "/login",
    name: "Login",
    component: Sawo,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
