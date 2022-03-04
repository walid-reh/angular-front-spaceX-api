<template>
<v-timeline-item
          color="blue"
          small
        >
          <v-row class="pt-1">
            <v-col cols="3">
              <strong>{{launchDate}}</strong>
            </v-col>
            <v-col>
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
import moment from 'moment'
export default{
    props: ["launch"],
    computed: {
        launchDate() {
            return moment(this.launch.launch_date_local).format("DD/MM/YYYY");
        }
    }
};

</script>