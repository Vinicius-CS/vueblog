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
            userData: {
                id          : Cookies.get('userData.id'),
                name        : Cookies.get('userData.name'),
                last_name   : Cookies.get('userData.last_name'),
                email       : Cookies.get('userData.email'),
                role        : Cookies.get('userData.role')
            },
        }
    },

    mutations: {
        setUserData (state, payload) {
            state.userData[payload.key] = payload.value;
            Cookies.set(`userData.${payload.key}`, payload.value, { expires: 3 });
        },

        removeUserData (state) {
            state.userData = {
                id          : undefined,
                name        : undefined,
                last_name   : undefined,
                email       : undefined,
                role        : undefined
            };

            Cookies.remove('userData.id'),
            Cookies.remove('userData.name'),
            Cookies.remove('userData.last_name'),
            Cookies.remove('userData.email'),
            Cookies.remove('userData.role')
        }
    }
})

const app = createApp(App);

app.use(router);
app.use(store);
app.use(vuetify);
app.mount('#app');