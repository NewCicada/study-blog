# Vue3常见api

## 基础api

### props

#### defineComponent 下的props

- `defineComponent`: 主要用于在ts中，对于组件中的data，prop，computed进行声明定义，因此在这个api下会有对组件的一些接口有补全。

在这个api下，我们定义props参数应该严格类型，遵循ts语法。
```typescript
<script lang="ts">
import { defineComponent, PropType } from 'vue'
interface Config {
  name: string,
}
export default defineComponent({
  props: {
    age: {
      type: Number as PropType<number>
    },
    config: {
      type: Object as PropType<Config>,
    }
  }
})
</script>
```
例如在这个例子中，我们age的类型最好利用PropType来声明，因为如果直接Number的话，这还是算js的语法，并且Number其实是js中是一个类。
  
这样做的好处在Object时最能体现，例如下面的config中，不用PropType，直接Object的话，其类型表述是：
![image](https://user-images.githubusercontent.com/72189350/214583751-adc46cd5-3275-4e7d-abcf-794db9b55f1f.png)
会自己帮我们设置为string。

而如果加上PropType，则类型表述是：
![image](https://user-images.githubusercontent.com/72189350/214584150-9cdcc041-ec75-4798-b604-0dd3cf38286e.png)

#### 提取props

当我们提取出props，并在required中设置为true后，发现在使用时已经未定义,在后面加上as const 即可.
```typescript
const PropsType = {
  msg: String,
  age: {
    type: Number,
    required: true,
  }
} as const

export default defineComponent({
  props: PropsType,
})
```


## setup语法糖中

- 取出定义的参数：`defineProps`
```Javascript
const props = defineProps({
  val: {
    type: String,
    default: ""
  }
})
```

子组件向父组件事件传递:`defineEmits`
```html
<template>
 <Child  @success="success"></Child>
</template>
<script setup>
function success (e) {
  console.log(e)
}
</script>

//子组件
<template>
 <button @click="handleClick">点击按钮</button>
</template>
<script setup>
import { defineEmits } from "vue"
const emits = defineEmits(['success'])
function handleClick () {
  emits("success", "子组件向父组件传递数据")
}
</script>
```

- 子组件暴露自己的属性或方法:`defineExpose`
```html
// 父组件
<template>
  <Child ref="RefChildExpose"></Child>
  <button @click="touchButton">点击使用子组件</button>
</template>
<script setup>
const RefChildExpose = ref(null)
function touchButton () {
  // 使用子组件方法
  RefChildExpose.value.show()
  // 输出子组件属性
  console.log(RefChildExpose.value.count)
}
</script>

// 子组件
<script setup>
import { defineExpose } from "vue"
function show () {
  console.log('显示')
}
defineExpose({
  show,
  count: 1
})
</script>
```

## 响应式对象获取

- `ref`: 用于为数据添加响应式状态
```Javascript
import { ref } from 'vue'
// 为基本数据类型添加响应式状态
const name = ref('Neo')

// 为复杂数据类型添加响应式状态
const state = ref({
  count: 0
})
```
- `reactive`: 用于为对象添加响应式状态。接收一个js对象作为参数，返回一个具有响应式状态的副本。获取数据值的时候直接获取，不需要加.value
```Javascript
import { reactive } from 'vue'

// 响应式状态
const state = reactive({
  count: 0
})

// 打印count的值
```
- `toRef` toRef 用于为源响应式对象上的属性新建一个ref，从而保持对其源对象属性的响应式连接
> 获取数据值的时候需要加.value，toRef后的ref数据不是原始数据的拷贝，而是引用，改变结果数据的值也会同时改变原始数据
```Javascript
import { toRef } from 'vue'
props: [title],

setup (props) {
  // 创建变量myTitle
  const myTitle = toRef(props, 'title')

  console.log(myTitle.value)
}
```
- `toRefs` toRefs 用于将响应式对象转换为结果对象，其中结果对象的每个属性都是指向原始对象相应属性的ref。
> 常用于es6的解构赋值操作，因为在对一个响应式对象直接解构时解构后的数据将不再有响应式，而使用toRefs可以方便解决这一问题. 获取数据值的时候需要加.value
toRefs后的ref数据不是原始数据的拷贝，而是引用，改变结果数据的值也会同时改变原始数据
```Javascript
import { toRefs } from 'vue'
props: [title],

setup (props) {
  // 使用了解构赋值语法创建了变量myTitle
  const { myTitle } = toRefs(props)

  console.log(myTitle.value)
}
```
## 其它
- `watchEffect`: 实现watch的功能
