import { defineStore } from 'pinia'
import Axios from 'axios';

const localhost = location.host;

const apiPizza = 'http://' + localhost + '/api/pizzas.json';

export const useDefaultStore = defineStore({
    id: 'default',
    state: () => ({
        "pizzas" : [],
    }),
    getters: {},
    actions: {
        loadData() {
            Axios.get(apiPizza)
                .then(response => response.data)
                .then(donneesPizzas => this.pizzas = donneesPizzas)
                .catch(error => {
                    console.error(error);
                });
        }
    }
});


