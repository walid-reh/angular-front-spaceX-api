<template>
        <v-timeline-item
          color="black"
          small
        >
          <v-row class="pt-1">
            <v-col cols="3">
              <strong>{{capsuleDate}}</strong>
            </v-col>
            <v-col>

              <div class="text-caption">
                  <v-card-title class="text-h5"><strong>MISSION: {{capsule.missions}}</strong></v-card-title>
                <v-card-text><strong>Capsule serie/type: </strong>{{capsule.capsule_serial}} / {{capsule.capsule_id}}</v-card-text>
              <v-card-text>{{capsule.details}}</v-card-text>
              </div>
            </v-col>
          </v-row>
        </v-timeline-item>
</template>

<script> 
import moment from 'moment'
export default{
    props: ["capsule"],
    computed: {
        capsuleDate() {
            return moment(this.capsule.original_launch).format("DD/MM/YYYY");
        }
    }
};

</script>