<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <div class="d-flex align-center">
        <!-- <h2>SpaceX Projet Launches</h2> -->
        <h2>SpaceX Capsules</h2>
      </div>

      <v-spacer></v-spacer>
    </v-app-bar>

    <v-main>
      <v-container>
        <!-- <v-timeline v-if="launches.length >0">
          <LaunchesItem v-for="launch in launches" :key="launch.flight_number" :launch="launch" />
        </v-timeline> -->
        <v-timeline v-if="capsules.length >0">
          <CapsuleItem v-for="capsule in capsules" :key="capsule.missions.flight" :capsule="capsule" />
        </v-timeline>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios';
//import LaunchesItem from './components/LaunchesItem'
import CapsuleItem from './components/CapsuleItem'

export default {
  name: 'App',

  components: {
    //LaunchesItem
    CapsuleItem
  },

  data: () => ({
    //launches: []
    capsules: []
  }),
  /*async created() {
    const {data} = await axios.get('https://api.spacexdata.com/v3/launches')

    data.forEach(launch =>{
      this.launches.push(launch);
    });


    console.log(this.launches)
  }*/

  async created() {
    const {data} = await axios.get('https://api.spacexdata.com/v3/capsules')

    data.forEach(capsule =>{
      this.capsules.push(capsule);
    });


    console.log(this.capsules)
  }
}

</script>