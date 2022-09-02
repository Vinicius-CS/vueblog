<template>
  <div class="home">
    <div class="content">
      <div class="card_list">
        <div v-for="results in this.article[page-1]" :key="results">
          <CardComponent :id="results.id" :title="results.title" :thumbnail="results.thumbnail" :description="results.description" :category="results.category" :tags="results.tags" :publish="formatDate(results.publish)" :author="results.author"/>
        </div>
      </div>
    </div>

    <div class="text-center" v-if="this.article[0].length > 0">
      <v-container>
        <v-row justify="center">
          <v-col cols="10">
            <v-container class="max-width">
              <v-pagination
                v-model="page"
                class="my-4"
                rounded="circle"
                :length="this.article.length"
              ></v-pagination>
            </v-container>
          </v-col>
        </v-row>
      </v-container>
    </div>
    <div class="text-center" v-else>
      <br><p>Nenhum artigo publicado...</p>
    </div>
  </div>
</template>

<style>
  @import 'HomeStyles.css';
</style>


<script>
  import CardComponent from '@/components/card/CardComponent.vue'
  import Config from '@/assets/config.json'
  import moment from 'moment'
  
  export default {
    name: 'HomeView',
    components: {
      CardComponent
    },

    data () {
      return {
        page    : 1,
        config  : Config,
        article : [[]]
      };
    },

    methods: {
      formatDate(value) {
        return moment(String(value)).format('DD/MM/YYYY')
      },
    },

    mounted() {
      const axios = require('axios').default;

      axios.post(`${Config.api_baseurl}/article`, {status: 1}).then(response => {
        let pageIndex = 0;
        let i = 0;

        response.data.forEach(result => {
          if (i < Config.perPage) {
            this.article[pageIndex].push(result);
            i++;

          } else {
            pageIndex++;
            this.article[pageIndex] = [];
            i = 0;

            this.article[pageIndex].push(result);
            i++;
          }
        });

      }).catch(err => {
        if (err.response != undefined) console.log(err.response);
      });
    },
  }
</script>