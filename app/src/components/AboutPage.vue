<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-img
          :src="require('../assets/SpaceX.svg')"
          class="my-3"
          contain
          height="200"
        />
      </v-col>

      <v-col class="mb-4">
        <h1 class="display-2 font-weight-bold mb-3">
          Welcome to our application
        </h1>

        <p class="subheading font-weight-regular">
          This application was created using vuejs version 2 and Space X API,
          and it displays data related launches and capsules from spaceX
          database.
          <br />please check the git repo with code source for this web
          application.
          <a
            href="https://github.com/walid-reh/vuejs-front-spaceX-api.git"
            target="_blank"
          ></a>
        </p>
      </v-col>

      <v-col class="mb-5" cols="12">
        <h2 class="headline font-weight-bold mb-3">SpaceX</h2>

        <v-row justify="center">
          <a
            v-for="(eco, i) in spaceX"
            :key="i"
            :href="eco.href"
            class="subheading mx-3"
            target="_blank"
          >
            {{ eco.text }}
          </a>
        </v-row>
      </v-col>

      <v-col class="mb-5" cols="12">
        <h2 class="headline font-weight-bold mb-3">Important Links</h2>

        <v-row justify="center">
          <a
            v-for="(link, i) in importantLinks"
            :key="i"
            :href="link.href"
            class="subheading mx-3"
            target="_blank"
          >
            {{ link.text }}
          </a>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "AboutPage",
  data: () => ({
    spaceX: [
      {
        text: "github repo for used API",
        href: "https://github.com/r-spacex/SpaceX-API",
      },
      {
        text: "Space X website",
        href: "https://www.spacex.com/",
      },
    ],
    importantLinks: [
      {
        text: "Documentation of VueJs",
        href: "https://vuejs.org/",
      },
      {
        text: "github repo for VueJs",
        href: "https://github.com/vuejs/",
      },
      {
        text: "SpaceX API docs",
        href: "https://docs.spacexdata.com/",
      },
      {
        text: "SpaceX shop",
        href: "https://shop.spacex.com/",
      },
      {
        text: "spaceX updates",
        href: "https://www.spacex.com/updates/",
      },
    ],
  }),
};
</script>
