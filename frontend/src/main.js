import 'vuetify/styles'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import { createStore } from 'vuex'
import Cookies from 'js-cookie'

loadFonts()

const store = createStore({
    state () {
        return {
            userData: Cookies.get('userData.name'),
        }
    },

    mutations: {
        setUserData (state, payload) {
            state.userData = payload.value;
            Cookies.set(`userData.${payload.key}`, payload.value, { expires: 3 });
        }
    }
})

const app = createApp(App);

app.use(router)
app.use(store)
app.use(vuetify)
app.mount('#app')