<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <div class="d-flex align-center">
        <h2>Frontend app with SpaceX API to display launches and capsules</h2>
      </div>

      <v-spacer></v-spacer>
    </v-app-bar>

    <v-main>
      <v-container>
        <v-tabs>
          <v-tab
            @click="
              Launches = true;
              Capsules = false;
              About = false;
            "
            >Launches</v-tab
          >
          <v-tab
            @click="
              Capsules = true;
              Launches = false;
              About = false;
            "
            >Capsules</v-tab
          >
          <v-tab
            @click="
              Capsules = false;
              Launches = false;
              About = true;
            "
            >About</v-tab
          >
        </v-tabs>
        <div id="app" v-if="About">
          <AboutPage msg="Welcome to Your Vue.js App" />
        </div>
        <v-timeline v-if="launches.length > 0 && Launches">
          <LaunchesItem
            v-for="launch in launches"
            :key="launch.flight_number"
            :launch="launch"
          />
        </v-timeline>
        <v-timeline v-if="capsules.length > 0 && Capsules">
          <CapsuleItem
            v-for="capsule in capsules"
            :key="capsule.missions.flight"
            :capsule="capsule"
          />
        </v-timeline>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";
import LaunchesItem from "./components/LaunchesItem";
import CapsuleItem from "./components/CapsuleItem";
import AboutPage from "./components/AboutPage";

export default {
  name: "App",

  components: {
    LaunchesItem,
    CapsuleItem,
    AboutPage,
  },

  data: () => ({
    launches: [],
    capsules: [],
    Launches: true, //boolean to check if Launches tab is selected
    Capsules: false, //boolean to check if Capsules tab is selected
    About: false, //boolean to check if Aboutpage tab is selected
  }),

  async created() {
    const { data } = await axios.get("https://api.spacexdata.com/v3/launches");

    data.forEach((launch) => {
      this.launches.push(launch);
    });

    console.log(this.launches);
  },

  async updated() {
    const { data } = await axios.get("https://api.spacexdata.com/v3/capsules");
    data.forEach((capsule) => {
      this.capsules.push(capsule);
    });
    console.log(this.capsules);
  },
};
</script>
