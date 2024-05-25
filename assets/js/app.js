/*
 * Welcome to your app's app JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

import { createApp } from 'vue';
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router/index.js'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.mount('#vue-app');


// any CSS you import will output into a single css file (app.css in this case)
import '../../public/css/style.css';

// start the Stimulus application
import '../bootstrap';
