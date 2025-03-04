import { createRouter, createWebHistory } from 'vue-router'
import ArticlesIndex from '@/views/ArticlesIndex.vue'

const routes = [
  { path: '/', component: ArticlesIndex },
  { path: '/articles/:id', component: () => import('@/views/ArticleShow.vue') }
]

export default createRouter({
  history: createWebHistory(),
  routes
})