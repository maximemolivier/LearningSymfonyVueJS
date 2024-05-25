<template>
  <div class="item">
    <img :src="'images/uploads/' + pizza.image" :alt="pizza.nom">
    <p>{{ pizza.nom }}</p>
    <p>{{ pizza.prix/100 }} €</p>
  </div>
</template>

<script setup>
import { defineProps} from 'vue'

const props = defineProps({
  pizza: Object
})


</script>

<style>

</style>