<template>
    <v-card
        class="mx-auto card"
        width="300"
        height="370"
        max-width="300"
    >
        <img :src="thumbnail"/>

        <v-card-subtitle>{{ publish }} - {{ author }}</v-card-subtitle>

        <v-card-title>{{ title }}</v-card-title>

        <v-card-text class="description">{{ description }}</v-card-text>

        <v-card-actions>
            <v-btn
                variant="flat"
                color="primary"
                :to="`article/${id}`"
            >
                Ler mais...
            </v-btn>
        </v-card-actions>
    </v-card>
</template>

<style>
    @import 'CardStyles.css';
</style>

<script>
    export default {
        name: 'CardComponent',
        props: {
            id          : Number,
            title       : String,
            thumbnail   : String,
            description : String,
            category    : String,
            tags        : String,
            publish     : String,
            author      : String
        }
    }
</script>