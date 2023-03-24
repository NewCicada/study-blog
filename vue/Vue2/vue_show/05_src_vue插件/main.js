//引入Vue
import Vue from 'vue'
//引入App
import App from './App'
// 引入插件
import plugins from './pluhins'
// 使用插件
Vue.use(plugins)
//关闭Vue的生产提示
Vue.config.productionTip = false
new Vue({
    el: '#app',
    render: (h) => h(App),
})
