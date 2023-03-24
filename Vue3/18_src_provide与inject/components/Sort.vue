<template>
  <div class="son">
    <h3>我是Son组件(孙){{ car.name }}---{{ car.price }}</h3>
  </div>
</template>

<script>
import { inject } from 'vue'
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: 'Son',
  setup() {
    let car = inject('car')
    return { car }
  },
}
</script>

<style>
.son {
  background-color: rgb(45, 172, 17);
  padding: 10px;
}
</style>