<template>
  <div class="child">
    <h3>我是Child组件(子)</h3>
    <Sort />
  </div>
</template>

<script>
import { inject } from 'vue'
import Sort from './Sort.vue'
export default {
  name: 'Child',
  components: { Sort },
  setup() {
    let x = inject('car')
  console.log(x,'child------');
  },
}
</script>

<style>
.child {
  background-color: skyblue;
  padding: 10px;
}
</style>