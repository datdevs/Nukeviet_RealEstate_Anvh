<template>
  <el-tabs v-model="activeTab" type="card" @tab-click="handleTabChange">
    <el-tab-pane label="Danh sách khách hàng" name="Customers"></el-tab-pane>
    <el-tab-pane label="Nhóm khách hàng" name="Groups"></el-tab-pane>
    <keep-alive>
      <router-view />
    </keep-alive>
  </el-tabs>
</template>

<script>
export default {
  data() {
    return {
      activeTab: 'Customers',
    }
  },
  computed: {
    currentRoute() {
      return this.$route.meta.tab
    },
  },
  watch: {
    currentRoute(val) {
      if (val === 'customers') {
        this.activeTab = 'Customers'
      } else if (val === 'groups') {
        this.activeTab = 'Groups'
      }
    },
  },
  methods: {
    handleTabChange(tab) {
      this.$router.push({ name: tab.name })
    },
  },
}
</script>
