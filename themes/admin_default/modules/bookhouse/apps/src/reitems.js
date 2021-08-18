import Vue from 'vue'

import { Alert, Button, Loading, PageHeader, Table, TableColumn, Message } from 'element-ui'
import lang from 'element-ui/lib/locale/lang/vi'
import locale from 'element-ui/lib/locale'

import App from './vue/App.vue'
import ImportView from './vue/views/ReItem-Import.vue'

ImportView.install = function (Vue) {
  Vue.component(ImportView.name, ImportView)
}

import './scss/app.scss'

locale.use(lang)

Vue.use(ImportView)
Vue.use(Alert)
Vue.use(Button)
Vue.use(Loading)
Vue.use(PageHeader)
Vue.use(Table)
Vue.use(TableColumn)
Vue.prototype.$message = Message

new Vue({
  el: '#vuj',
  render: (h) => h(App),
})
