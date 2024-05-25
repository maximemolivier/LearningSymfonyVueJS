
<template>
  <section class="list-pizzas">
    <PizzaTemplate v-for="(pizza, index) in pizzas" :key="index" :pizza="pizza"></PizzaTemplate>
  </section>
  <button class="btn" @click="previousPizza">&lt</button>
  <button class="btn" @click="nextPizza">&gt</button>
</template>

<script setup>
import { useDefaultStore } from '../store/index'
import PizzaTemplate from "./Pizza.vue";
import { useRouter } from 'vue-router'
import {computed, ref} from "vue";

const router = useRouter()
const store = useDefaultStore()
const Index = ref(0)
const NbrPizza = 4

const pizzas = computed(() => {
  const startIndex = Index.value * NbrPizza
  const endIndex = startIndex + NbrPizza
  return store.pizzas.slice(startIndex, endIndex)
})

function previousPizza() {
  Index.value = Math.max(0, Index.value - 1)
}

function nextPizza() {
  const NbrPizzaTotal = Math.ceil(store.pizzas.length / NbrPizza)
  Index.value = Math.min(Index.value + 1, NbrPizzaTotal - 1)
}

</script>

<style>

</style>