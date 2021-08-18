const routes = [
  {
    path: '/list',
    name: 'Customers',
    component: () => import(/* webpackChunkName: "CustomerList" */ '@/vue/views/Customers.vue'),
    alias: '/',
    meta: {
      tab: 'customers',
    },
  },
  {
    path: '/groups',
    name: 'Groups',
    component: () => import(/* webpackChunkName: "CustomerGroups" */ '@/vue/views/Groups.vue'),
    meta: {
      tab: 'groups',
    },
  },
]

export default routes
