<template>
    <div class="article">
      <div class="content">
        <p class="title">{{ response.title }}</p>
        <p class="description">{{ response.description }}</p>
        <p class="infos">Publicado por <b>{{ response.author }}</b> em <b>{{ formatDate(response.publish) }}</b>.</p>
        <hr/>
        <span v-html="response.content"></span>
      </div>
    </div>
</template>

<style>
    @import 'ArticleStyles.css';
</style>

<script>
    import moment from 'moment'

    import ArticleData from '@/responses/article/ArticleData.json'

    export default {
        name: 'ArticleView',

        data () {
            return {
                response: ArticleData
            };
        },

        methods: {
            formatDate(value) {
                return moment(String(value)).format('DD/MM/YYYY')
            },
        },

        mounted() {
            this.response = ArticleData[`article_${this.$route.params.id}`];
        }
    }
</script>