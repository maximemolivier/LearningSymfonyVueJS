<script setup>
import { onMounted } from 'vue';
import { useDefaultStore } from './store/index'

const store = useDefaultStore()

onMounted(() => {
  store.loadData()
})

</script>

<template>
  <router-view></router-view>
</template>

<style>


</style>