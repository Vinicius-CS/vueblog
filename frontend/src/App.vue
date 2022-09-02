<template>
  <v-app>
    <v-main>
      <nav class="nav">
          <table>
              <tr>
                  <td class="logo">
                    <router-link to="/">
                      <img to="/" src="../../logo.png"/>
                    </router-link>
                  </td>
                  <td class="menu">
                      <router-link class="router" to="/">Início</router-link>
                      <router-link class="router" to="/about">Sobre</router-link>
                      <router-link class="router" to="/login" v-if="this.$store.state.userData.id == null">Login</router-link>
                      <router-link class="router" to="/panel" v-else-if="this.$store.state.userData.role > 1">Painel</router-link>
                      <a class="exit" :onclick="onClickHandlerEvent" v-else>Sair</a>
                  </td>
              </tr>
          </table>
      </nav>
      <router-view/>
      <footer class="footer">
        <br>{{ new Date().getFullYear() == 2022 ? new Date().getFullYear() : '2022 - ' + new Date().getFullYear() }} | Blog
      </footer>
    </v-main>
  </v-app>
</template>

<style>
  @import '@/assets/styles.css';
</style>

<script>
  import router from '@/router';

  export default {
    name: "App",

    methods: {
      onClickHandlerEvent() {
        this.$store.commit('removeUserData');
        router.push('/');
      }
    }
  }
</script>
