<template>
  <div class="container">
    <h1>Add A Beer</h1>
    <section id="form">
      <label for="brewerySelect">Select Brewery:</label>
      <select v-model="newBeer.breweryId" @change="fetchBreweryInfo" id="brewerySelect" class="form-control">
        <option value="" id="select">Select a brewery</option>
        <option v-for="brewery in breweries" :key="brewery.breweryId" :value="brewery.breweryId">{{ brewery.name }}
        </option>
      </select>

      <form class="row g-3" v-on:submit.prevent="addNewBeer">
        <div class="col-md-4">
          <label for="inputBeer" class="form-label">Beer Name</label>
          <input v-model="newBeer.name" type="text" class="form-control" id="inputBeer" placeholder="Enter Beer Name">
        </div>
        
        <div class="col-4">
          <label for="inputStyle" class="form-label">Style</label>
          <input v-model="newBeer.style" type="text" class="form-control" id="inputStyle" placeholder="Enter Style">
        </div>
        <div class="col-2">
          <label for="inputABV" class="form-label">ABV</label>
          <input v-model="newBeer.abv" type="number" class="form-control" id="inputABV" placeholder="Enter ABV">
        </div>
        <div class="col-md-2">
          <label for="inputIBU" class="form-label">IBU</label>
          <input v-model="newBeer.ibu" type="number" class="form-control" id="inputIBU" placeholder="Enter IBU">
        </div>
        <div class="col-md-6">
          <label for="inputDescription" class="form-label">Description</label>
          <input v-model="newBeer.description" type="text" class="form-control" id="inputDescription" placeholder="Enter Description">
        </div>
        <div class="col-md-6">
          <label for="inputImage" class="form-label">Image</label>
          <input v-model="newBeer.imageUrl" type="text" class="form-control" id="inputImage" placeholder="Enter Image URL">
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
    </section>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService';


export default {
  props: ['beerId'],


  data() {
    return {
      newBeer: {},
      breweries: [],
      brewery: {
        breweryId: '',
        name: '',
        location: '',
        establishedYear: '',
        description: '',
        imageUrl: '',
      },

    };
  },
  mounted() {

    this.fetchBreweries();
  },

  methods: {
    addNewBeer() {

      BreweryService.addBeer(this.newBeer)
        .then(response => {
          if (response.status === 201 || response.status === 200) {
            this.$router.push({
              name: 'add'
            });
          }
          this.resetForm()
        })

        .catch(err => console.error(err));

    },
    resetForm() {
      this.newBeer = {
        beerId: null,
        name: "",
        breweryId: null,
        style: "",
        abv: null,
        ibu: null,
        description: "",
        imageUrl: ""
      }
    },
    fetchBreweries() {

      BreweryService.listAllBreweries()
        .then(response => {
          this.breweries = response.data;
        })
        .catch(error => {
          console.error('Error fetching breweries:', error);
        });
    },
    fetchBreweryInfo() {

      BreweryService.getBreweryInfo(this.brewery.breweryId)
        .then(response => {
          this.brewery = response.data;
        })
        .catch(error => {
          console.error('Error fetching brewery information:', error);
        });
    },
  }
}
</script>

<style>
h1 {
  text-align: center;
  padding-bottom: 30px;
  padding-top: 5px;
  font-family: "Cinzel"
}

.form-label {
    font-weight: bold;
}
.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
}

.form-control {
    width: 100%;
    padding: 1px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-family: 'Balthazar'
}

.form-group {
  margin-bottom: 20px;
}


form {
  text-align: center;

}

form div {
  padding-bottom: 6%;
  padding-left: 2%;
  padding-right: 2%;
  position: center;
}

section {
  width: 80%;

  padding-left: 15%;

}

button.btn.btn-primary {
  padding: 8px 15px;
  background-color: #0A1823;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 15px;
  margin-top: 10px;
  width: 25%;
  font-family: "Cinzel"
}

button.btn.btn-primary:hover {
    text-decoration: underline !important;
}

label {
  font-family: "Balthazar";
  font-weight: bold;
}

.col-md-4, .col-4, .col-2, .col-md-2 {
  padding-top: 30px;
  padding-bottom: 10px;
}

</style>