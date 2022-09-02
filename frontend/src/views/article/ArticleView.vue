<template>
    <div class="article">
      <div class="body">
        <p class="title">{{ response.title }}</p>
        <p class="description">{{ response.description }}</p>
        <p class="infos">Publicado por <b>{{ response.author }}</b> em <b>{{ formatDate(response.publish) }}</b><br><b>Categoria:</b> {{ response.category }}  | <b>Tags:</b> {{ response.tags }}</p>
        <hr/>
        <div class="content" v-html="response.content"></div>
      </div>
    </div>
</template>

<style>
    @import 'ArticleStyles.css';
</style>

<script>
    import Config from '@/assets/config.json'
    import moment from 'moment'

    export default {
        name: 'ArticleView',

        data () {
            return {
                response: {}
            };
        },

        methods: {
            formatDate(value) {
                return moment(String(value)).format('DD/MM/YYYY')
            },
        },

        mounted() {
            const axios = require('axios').default;

            axios.get(`${Config.api_baseurl}/article/${this.$route.params.id}`).then(response => {
                this.response = response.data[0];
            }).catch(err => {
                if (err.response != undefined) console.log(err.response);
            });
        }
    }
</script>