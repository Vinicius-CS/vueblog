<template>
  <div class="register">
    <div class="content">
      <p class="title">Registre-se</p>
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
          v-model="name"
          :rules="nameRules"
          label="Nome"
          :onkeyup="errorMessage = null"
          required
        ></v-text-field>

        <v-text-field
          v-model="last_name"
          :rules="lastnameRules"
          label="Sobrenome"
          :onkeyup="errorMessage = null"
          required
        ></v-text-field>

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
          @click="register();"
        >
          Registrar-se
        </v-btn>

        <v-btn
          color="primary"
          class="mr-4"
          to="/login"
        >
          Voltar ao login
        </v-btn>
      </v-form>
    </div>
  </div>
</template>

<style>
  @import 'RegisterStyles.css';
</style>

<script>
  import Config from '@/assets/config.json';
  import router from '@/router';

  export default {
    data: () => ({
      valid         : true,
      userdata      : null,
      errorMessage  : null,

      name          : '',
      last_name     : '',
      email         : '',
      password      : '',

      nameRules: [
        v => !!v || 'Preencha este campo.'
      ],
      lastnameRules: [
        v => !!v || 'Preencha este campo.'
      ],
      emailRules: [
        v => !!v || 'Preencha este campo.',
        v => /[a-z0-9.-]+@[a-z0-9]+\.+[a-z0-9]+$/i.test(v) || 'Formato de e-mail inválido'
      ],
      passwordRules: [
        v => !!v || 'Preencha este campo.'
      ]
    }),

    methods: {
      register () {
        const axios = require('axios').default;

        axios.post(`${Config.api_baseurl}/register`, {name: this.name, last_name: this.last_name, email: this.email, password: this.password, role: 1}).then(response => {
          switch (response.status) {
            case 204:
              this.errorMessage = 'E-mail em uso';
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
            this.errorMessage = 'Ocorreu um erro ao registrar-se, tente novamente mais tarde';
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