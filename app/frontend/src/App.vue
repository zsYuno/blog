<template>
  <div id="app">
    <nav class="bg-gray-800 p-4">
      <router-link to="/" class="text-white mr-4">Home</router-link>
      <button v-if="isAuthenticated" @click="logout">Logout</button>
      <router-link v-else to="/login" class="text-white">Login</router-link>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const router = useRouter()
const isAuthenticated = ref(false)

const checkAuth = async () => {
  try {
    await axios.get('/api/v1/check_auth')
    isAuthenticated.value = true
  } catch {
    isAuthenticated.value = false
  }
}

const logout = async () => {
  await axios.delete('/api/v1/logout')
  router.push('/login')
}

onMounted(checkAuth)
</script>