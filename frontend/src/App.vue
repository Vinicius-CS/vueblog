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
                  </td>
              </tr>
          </table>
      </nav>
      <router-view/>
    </v-main>
  </v-app>
</template>

<style>
  @import '@/assets/styles.css';
</style>

<script>
  export default {
    name: "App",
    
    data: () => ({
    //
    }),

    components: {
    }
  }
</script>
