# h函数和render函数

在vue中，很多文件的开发都是在.vue文件的，这种文件开发是分为三大块来写，可以像类似写HTML时的感觉，这也是vue的卖点之一给新手更易于上手。

但是我们要知道，.vue实际上也是需要通过一些打包工具来编译成js代码才能执行。

h函数就是把.vue中的代码编辑成一个虚拟DOM，最终会把template解析为render函数返回虚拟DOM，这点可以在Vue Dev Tools中看到：

![image](https://user-images.githubusercontent.com/72189350/214593236-54a2d8fe-277c-4954-b8b4-cce69f0792cf.png)


也就是说，h函数是负责创建虚拟DOM，render是负责把这个虚拟DOM返回出去。

h函数可以接受三个参数
- 1.结点，这个参数可以是vue组件，也可以是DOM结点。
- 2.结点上的参数
- 3.改结点下的子节点，可以用一个数组表示多个子节点

下面我们可以来简单实现一下vue的默认App。
![image](https://user-images.githubusercontent.com/72189350/214594109-50adccba-1330-41c0-a6b7-5d602ab28c61.png)

```typescript
import HelloWorld from './components/HelloWorld.vue'
import { createApp, defineComponent, h } from 'vue'
const img = require('./assets/logo.png') // eslint-disable-line
// import App from './App.vue'

const App = defineComponent({
  render() {
    return h('div', { id: 'app' }, [
      h('img', {
        alt: 'Vue logo',
        src: img,
      }),
      h(HelloWorld, {
        msg: 'Welcome to Your Vue.js + TypeScript App',
      }),
    ])
  },
})

createApp(App).mount('#app')
```

![image](https://user-images.githubusercontent.com/72189350/214594602-fa1dd53f-153d-44f6-8f27-b74d5137302f.png)

在vue3中的setup，在setup返回时的值也是一个渲染函数，因此我们上面的render其实可以改在setup中执行，那这样我们就可以利用setup来定义变量等内容。

```typescript
const App = defineComponent({
  setup() {
    let state = reactive({
      name: 'lyy',
    })

    let numberRef = ref(1);

    setInterval(() => {
      state.name += '1',
      numberRef.value += 1
    }, 1000)
    
    // const number1 = numberRef.value // 1

    return () => {
      const number2 = numberRef.value  // result
      return h('div', { id: 'app' }, [
        h('img', {
          alt: 'Vue logo',
          src: img,
        }),
        h(HelloWorld, {
          msg: 'Welcome to Your Vue.js + TypeScript App' + state.name,
        }),
        h(p, state.name + number2),
      ])
    }
  },
})
```

在setup中，setup只会在最开始执行一次，后面通过一些响应式触发，例如在这里设置的定时器setInterval，每次触发都会重新渲染return中的值，构建新的虚拟DOM。

但是要注意，返回的渲染函数在这里构建了一个闭包的环境，而这里是通过响应式触发的，因此在setup中定义的普通变量，在后续不会再更新了。也就是number1

如果要实时获取，只能再渲染函数中定义再获取到。

## 使用tsx
[官方地址](https://github.com/vuejs/babel-plugin-jsx)

安装：`yarn add @vue/babel-plugin-transform-vue-jsx -D`
配置：再babal.config中增加
```Javascript
plugins: ['@vue/babel-plugin-jsx'],
```
接下来就可以使用tsx了。



