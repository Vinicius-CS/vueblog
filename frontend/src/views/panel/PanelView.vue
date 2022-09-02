<template>
  <div class="panel">
    <div class="content">
      <p class="title">Painel</p>
      <hr/>
      <v-btn
          color="primary"
          class="mr-4"
          :onclick="onClickHandlerEvent"
        >
          Sair
        </v-btn>
    </div>
  </div>
</template>

<style>
  @import 'PanelStyles.css';
</style>

<script>
import router from '@/router';

  export default {
    data: () => ({
      valid     : true,
      userdata  : null,

      email     : '',
      password  : '',
      
      emailRules: [
        v => !!v || 'Preencha este campo.',
        v => /.+@.+\..+/.test(v) || 'Formato de e-mail inválido',
      ],
      passwordRules: [
        v => !!v || 'Preencha este campo.',
      ]
    }),

    methods: {
      onClickHandlerEvent() {
        this.$store.commit('removeUserData');
        router.push('/');
      }
    },

    beforeMount() {
      if (this.$store.state.userData.id == null) {
        router.push('/');
      }
    }
  }
</script>