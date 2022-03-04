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
          <!-- In the App.vue we need to use our Component like a tag to see it -->
          <AboutPage msg="Welcome to Your Vue.js App" />
        </div>
        <v-timeline v-if="launches.length > 0 && Launches">
          <!-- In the App.vue we need to use our Component like a tag to see it -->
          <!-- we use v-for to create a loop where we can find the launches data from spaceX API, we use the flight number because it's unique for each launch -->
          <LaunchesItem
            v-for="launch in launches"
            :key="launch.flight_number"
            :launch="launch"
          />
        </v-timeline>
        <v-timeline v-if="capsules.length > 0 && Capsules">
          <!-- In the App.vue we need to use our Component like a tag to see it -->
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

// To access the data from our different component
import LaunchesItem from "./components/LaunchesItem";
import CapsuleItem from "./components/CapsuleItem";
import AboutPage from "./components/AboutPage";

export default {
  name: "App",

  components: {
    // Here we can find the component from the folder components
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
    // We use Axios when we want to exchange information with an API, here is the API spaceXdata
    //With this request we can get Launches
    const { data } = await axios.get("https://api.spacexdata.com/v3/launches");

    // Define a forEach to get the different object launch data. first we visualise the data on Postman and after we compare if this is the same
    data.forEach((launch) => {
      this.launches.push(launch);
    });

    console.log(this.launches);
  },

  async updated() {
    // We use Axios when we want to exchange information with an API, here is the API spaceXdata
    //With this request we can get Capsules
    const { data } = await axios.get("https://api.spacexdata.com/v3/capsules");

    // Define a forEach to get the different object capsule. first we visualise the data on Postman and after we compare if this is the same
    data.forEach((capsule) => {
      this.capsules.push(capsule);
    });
    console.log(this.capsules);
  },
};
</script>
