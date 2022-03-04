<template>
        <!-- This timeline item from Vuetify, Vuetify is a framework for Vue.js it's easier to implement a Vue with Vuetify -->
        <v-timeline-item
          color="blue"
          small
        >
          <v-row class="pt-1">
            <v-col cols="3">
              <!-- We call the method capsuleDate to display the launch date -->
              <strong>{{capsuleDate}}</strong>
            </v-col>
            <v-col>
                <!-- Like the js syntax we can display a data with {} in the App.vue we use Axios to treat the get request with the liste of the capsule"    -->
                <v-card-title class="text-h5"><b>Capsule:</b> {{capsule.capsule_serial}}</v-card-title>
                <v-card-title class="text-h5"><b>Type:</b> {{capsule.capsule_id}}</v-card-title>
                <v-card-title class="text-h5"><b>Status:</b> {{capsule.status}}</v-card-title>
              <v-card-text>{{capsule.details}}</v-card-text>
            </v-col>
          </v-row>
        </v-timeline-item>
</template>

<script> 
// We use moment the for date format of the capsule launch date
import moment from 'moment'
export default{
    props: ["capsule"],
    computed: {
        capsuleDate() {
          // We retrive the date of the capsule launch in American format and we modify it to display in European format
            return moment(this.capsule.original_launch).format("DD/MM/YYYY");
        }
    }
};

</script>