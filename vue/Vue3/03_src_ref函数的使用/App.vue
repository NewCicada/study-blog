<template>
  <h1>一个人的信息</h1>
  <h2>姓名:{{ name }}</h2>
  <h2>年龄:{{ age }}</h2>
  <h3>工作种类:{{ job.type }}</h3>
  <h3>薪资:{{ job.salary }}</h3>
  <button @click="changeInfo">修改人的信息</button>
</template>

<script>
import { ref } from 'vue'
export default {
  name: 'App',
  setup() {
    // 数据
    let name = ref('张三')
    let age = ref(18)
    let job = ref({
      type: '前端工程师',
      salary: '30k',
    })
    // 方法
    function changeInfo() {
      name.value = '李四'
      age.value = 48
      // console.log(job.value) 
      job.value.type = 'UI设计师'
      job.value.salary = '80k'
      // console.log(name, age)
    }
    // 返回一个对象
    return {
      name,
      age,
      changeInfo,
      job,
    }
  },
}
</script>

<style>
</style>