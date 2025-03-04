<template>
  <div class="search-container">
    <input v-model="searchText" @input="updateSearch" placeholder="記事を検索">
    <select v-model="selectedCategory" @change="updateFilter">
      <option value="">すべてのカテゴリ</option>
      <option v-for="category in categories" :value="category.id">
        {{ category.name }}
      </option>
    </select>
  </div>
</template>

<script>
export default {
  props: ['categories'],
  data() {
    return {
      searchText: '',
      selectedCategory: ''
    }
  },
  methods: {
    updateSearch() {
      this.$emit('search-updated', this.searchText)
    },
    updateFilter() {
      this.$emit('filter-updated', this.selectedCategory)
    }
  }
}
</script>