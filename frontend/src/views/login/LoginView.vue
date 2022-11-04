<template>
  <div class="login">
    <div class="content">
      <p class="title">Login</p>
      <hr/>
      <div class="alert">
        <v-alert class="content" type="error" v-if="errorMessage != null">{{ errorMessage }}</v-alert>
      </div>
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
        class="form"
      >
        <v-text-field
          v-model="email"
          :rules="emailRules"
          label="E-Mail"
          :onkeyup="errorMessage = null"
          required
        ></v-text-field>

        <v-text-field
          v-model="password"
          :rules="passwordRules"
          type="password"
          label="Senha"
          :onkeyup="errorMessage = null"
          required
        ></v-text-field>

        <v-btn
          :disabled="!valid"
          color="primary"
          class="mr-4"
          @click="login();"
        >
          Entrar
        </v-btn>

        <v-btn
          color="primary"
          class="mr-4"
          to="/register"
        >
          Registrar-se
        </v-btn>
      </v-form>
    </div>
  </div>
</template>

<style>
  @import 'LoginStyles.css';
</style>

<script>
  import Config from '@/assets/config.json';
  import router from '@/router';

  export default {
    data: () => ({
      valid         : true,
      userdata      : null,
      errorMessage  : null,

      email         : '',
      password      : '',

      emailRules: [
        v => !!v || 'Preencha este campo.',
        v => /[a-z0-9.-]+@[a-z0-9]+\.+[a-z0-9]+$/i.test(v) || 'Formato de e-mail inválido',
      ],
      passwordRules: [
        v => !!v || 'Preencha este campo.',
      ]
    }),

    methods: {
      login () {
        const axios = require('axios').default;

        axios.post(`${Config.api_baseurl}/login`, {email: this.email, password: this.password}).then(response => {
          switch (response.status) {
            case 204:
              this.errorMessage = 'E-mail ou senha inválidos';
              break;
          
            default:
              this.errorMessage = null;
              break;
          }

          this.$store.commit('setUserData', {key: 'id', value: response.data[0].id});
          this.$store.commit('setUserData', {key: 'name', value: response.data[0].name});
          this.$store.commit('setUserData', {key: 'last_name', value: response.data[0].last_name});
          this.$store.commit('setUserData', {key: 'email', value: response.data[0].email});
          this.$store.commit('setUserData', {key: 'role', value: response.data[0].role});
          
          router.push('/');
        }).catch(err => {
          if (err.response != undefined) {
            this.errorMessage = 'Ocorreu um erro ao fazer login, tente novamente mais tarde';
            console.log(err.response);
          }
        });
      }
    },

    beforeMount() {
      if (this.$store.state.userData.id != null) {
        router.push('/');
      }
    }
  }
</script>