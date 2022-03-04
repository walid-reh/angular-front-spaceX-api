<template>
<!-- This timeline item from Vuetify, Vuetify is a framework for Vue.js it's easier to implement a Vue with Vuetify. We can say it's like material-ui with React -->
<v-timeline-item
          color="blue"
          small
        >
          <v-row class="pt-1">
            <v-col cols="3">
              <!-- We call the method launchDate to display the launch date -->
              <strong>{{launchDate}}</strong>
            </v-col>
            <v-col>
              <!-- In the {} we can find the data thanks to Axios, we can retrieve the date from the request get and display the data from the same request    -->
              <v-col-title class="text-h5">Mission name: {{launch.mission_name}}</v-col-title><br>
              <v-col-title class="text-h5">Patch: </v-col-title>
              <v-avatar>
                <img :src="launch.links.mission_patch_small">
              </v-avatar><br>
              <v-col-subtitle> <b>Launch site:</b> {{launch.launch_site.site_name_long}}</v-col-subtitle><br>
              <v-col-subtitle><b>Success:</b> {{launch.launch_success}}</v-col-subtitle><br>
              <v-col-subtitle><b>Rocket:</b> {{launch.rocket.rocket_name}}</v-col-subtitle><br>
              <v-col-text>{{launch.details}}</v-col-text>
            </v-col>
          </v-row>
        </v-timeline-item>
</template>

<script> 
// We use moment the for date format of the capsule launch date
import moment from 'moment'
export default{
    props: ["launch"],
    computed: {
        launchDate() {
          // We retrieve the date of the capsule launch in American format and we modify it to display in European format
            return moment(this.launch.launch_date_local).format("DD/MM/YYYY");
        }
    }
};

</script>