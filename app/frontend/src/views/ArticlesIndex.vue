<template>
    <div class="container mx-auto p-4">
      <h1 class="text-2xl mb-4">All Articles</h1>
      <div v-for="article in articles" :key="article.id" class="mb-4 p-4 border rounded">
        <h2 class="text-xl">{{ article.title }}</h2>
        <p class="text-gray-600">{{ truncate(article.content) }}</p>
        <router-link :to="`/articles/${article.id}`" class="text-blue-500">Read More</router-link>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  import axios from 'axios'
  
  const articles = ref([])
  
  const fetchArticles = async () => {
    const response = await axios.get('/api/v1/articles')
    articles.value = response.data
  }
  
  const truncate = (text) => {
    return text.length > 100 ? text.substring(0, 100) + '...' : text
  }
  
  onMounted(fetchArticles)
  </script>