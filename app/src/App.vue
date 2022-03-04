<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <div class="d-flex align-center">
        <h2>SpaceX Projet Launches</h2>
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
            "
            >Launches</v-tab
          >
          <v-tab
            @click="
              Capsules = true;
              Launches = false;
            "
            >Capsules</v-tab
          >
        </v-tabs>
        <v-timeline v-if="launches.length > 0 && Launches">
          <LaunchesItem
            v-for="launch in launches"
            :key="launch.flight_number"
            :launch="launch"
          />
        </v-timeline>
        <div id="app" v-if="Capsules">
          <img alt="Vue logo" src="./assets/logo.png" />
          <HelloWorld msg="Welcome to Your Vue.js App" />
        </div>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";
import LaunchesItem from "./components/LaunchesItem";
import HelloWorld from "./components/HelloWorld";
export default {
  name: "App",

  components: {
    LaunchesItem,
    HelloWorld,
  },

  data: () => ({
    launches: [],
    Launches: true,
    Capsules: false,
  }),

  async created() {
    const { data } = await axios.get("https://api.spacexdata.com/v3/launches");

    data.forEach((launch) => {
      this.launches.push(launch);
    });

    console.log(this.launches);
  },
};
</script>
