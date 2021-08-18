import Vue from 'vue'
import VueRouter from 'vue-router'

import {
  Alert,
  Button,
  Card,
  Loading,
  PageHeader,
  Tabs,
  TabPane,
  Table,
  TableColumn,
  Pagination,
  Message,
  MessageBox,
  Row,
  Col,
  Form,
  FormItem,
  Input,
  DatePicker,
  Select,
  Option,
  Dialog,
  Drawer,
} from 'element-ui'
import lang from 'element-ui/lib/locale/lang/vi'
import locale from 'element-ui/lib/locale'

import App from './vue/App-Customers.vue'
import routes from './router/index'

import './scss/app.scss'

locale.use(lang)

Vue.use(VueRouter)
Vue.use(Alert)
Vue.use(Button)
Vue.use(Card)
Vue.use(Loading)
Vue.use(PageHeader)
Vue.use(Tabs)
Vue.use(TabPane)
Vue.use(Table)
Vue.use(TableColumn)
Vue.use(Pagination)
Vue.use(Row)
Vue.use(Col)
Vue.use(Form)
Vue.use(FormItem)
Vue.use(Input)
Vue.use(DatePicker)
Vue.use(Select)
Vue.use(Option)
Vue.use(Dialog)
Vue.use(Drawer)
Vue.prototype.$message = Message
Vue.prototype.$confirm = MessageBox.confirm

const router = new VueRouter({
  routes,
})

new Vue({
  el: '#vuj',
  router,
  render: (h) => h(App),
})
