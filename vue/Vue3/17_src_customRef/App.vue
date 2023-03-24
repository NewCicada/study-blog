<template>
  <input type="text" v-model="keyWord" />
  <h3>{{ keyWord }}</h3>
</template>

<script>
import { ref, customRef } from 'vue'
export default {
  name: 'App',
  setup() {
    // 自定义一个ref--名为myRef
    function myRef(value, delay) {
      let timer
      // 通过customRef去实现自定义
      return customRef((track, trigger) => {
        return {
          get() {
            console.log(`有人从myRef这个容器中读取数据了,我把${value}给他了`)
            track() //告诉Vue这个value值是需要被“追踪”的
            return value
          },
          set(newValue) {
            console.log(`有人把myRef这个容器中数据改为了${newvalue}`)
            // eslint-disable-next-line no-undef
            clearTimeout(timer)
            // eslint-disable-next-line no-undef
            timer = setTimeout(() => {
              value = newValue
              trigger() //通知Vue去更新界面
            }, delay)
          },
        }
      })
    }
    // let keyWord = ref(hello)//使用Vue提供的ref
    let keyWord = myRef('hello', 500) //使用程序员自定义的ref

    return { keyWord }
  },
}
</script>

<style>
</style>