<template>
  <div id="wholePage">
    <div id="banner">
      <h1>Brewery Results </h1>
      <p></p>
    </div>
    <div class="brewery-container" v-if="!searchResults.length>0" >
      <div class="brewery-item" v-for="brewery in breweries" :key="brewery.name">
        <BreweryCard :brewery="brewery" />
      </div>
    </div>
    <div class="brewery-container" v-else>
      <div class="brewery-item" v-for="brewery in searchResults" :key="brewery.name">
        <BreweryCard :brewery="brewery"/>
      </div>
    </div>
  </div>
</template>

<script>
import BreweryCard from './BreweryCard.vue';

export default {
  components: {
    BreweryCard
  },
  computed: {
    breweries() {
      return this.$store.state.breweryList;
    }
  },
  created() {
    this.$store.dispatch('getAllBreweries');
  },

  props: ['searchResults'],
}
</script>

<style scoped>

#banner {
  text-align: center;
  padding: 10px; /* Adjust the padding as needed */
}

#wholePage {
  padding: 0; /* Remove padding to allow full width */

}

.brewery-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around; /* Evenly distribute items with equal space around them */
  max-width: 1200px; /* Set a max width to limit the container's width */
  margin: 0 auto; /* Center the container horizontally */
}

.brewery-item {
  flex: 0 1 calc(33.33% - 20px); /* Adjust the width of each card (in this case, 33.33% width for three cards per row) */
  margin: 10px; /* Adjust margin as needed */
}

h1 {
  text-align: left;
  font-family: "Cinzel";
  font-weight: bold;
  color: rgb(255, 255, 255);
  margin-left: 100px;
  margin-top: 30px;

}

p {
  font-family: "Balthazar"
}
</style>


