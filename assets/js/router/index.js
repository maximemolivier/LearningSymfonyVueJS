import { createRouter, createWebHashHistory } from 'vue-router'
import Pizzas from "../components/Pizzas.vue";

const routes = [
    // À compléter
    {
        path: '/',
        name : 'homepage',
        component : Pizzas
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes,
})

export default router