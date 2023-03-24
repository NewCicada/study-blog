<template>
  <h1>一个人的信息</h1>
  <h2>姓名:{{ person.name }}</h2>
  <h2>年龄:{{ person.age }}</h2>
  <button @click="test">测试触发一下Demo事件的hello事件</button>
</template>

<script>
import { reactive } from 'vue'
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: 'Demo',
  props: ['msg', 'school'],
  emits: ['hello'],
  setup(props, content) {
    // console.log('---setup---', props)
    // console.log('---setup---', content)
    console.log('---setup---', content.slots) //插槽
    // console.log('---setup---', content.attrs) //详单与Vue2中的$attrs
    // console.log('---setup---', content.emit) //触发自定义事件的。
    // 数据
    let person = reactive({
      name: '张三',
      age: 18,
    })
    function test() {
      content.emit('hello', 666)
    }
    // 返回一个对象(常用)
    return {
      person,
      test,
    }
  },
}
</script>

<style>
</style>