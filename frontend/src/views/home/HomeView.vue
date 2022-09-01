<template>
  <div class="home">
    <div class="content">
      <div class="card_list">
        <div v-for="results in response.pages.results[page-1]" :key="results">
          <CardComponent :id="results.id" :title="results.title" :thumbnail="results.thumbnail" :description="results.description" :category="results.category" :tags="results.tags" :publish="formatDate(results.publish)" :author="results.author"/>
        </div>
      </div>
    </div>

    <div class="text-center">
      <v-container>
        <v-row justify="center">
          <v-col cols="10">
            <v-container class="max-width">
              <v-pagination
                v-model="page"
                class="my-4"
                rounded="circle"
                :length="response.pages.pagesSize"
              ></v-pagination>
            </v-container>
          </v-col>
        </v-row>
      </v-container>
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

  import ArticleList from '@/responses/home/ArticleList.json'
  
  export default {
    name: 'HomeView',
    components: {
      CardComponent
    },

    data () {
      return {
        page: 1,
        config: Config,
        response: ArticleList
      };
    },

    methods: {
      formatDate(value) {
        return moment(String(value)).format('DD/MM/YYYY')
      },
    },
  }
</script>