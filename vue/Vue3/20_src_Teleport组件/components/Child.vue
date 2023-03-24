<template>
  <div class="child">
    <h3>我是Child组件</h3>
    <Sort />
  </div>
</template>

<script>
import Sort from './Sort'
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: 'Child',
  components: { Sort },
}
</script>

<style>
.child {
  background-color: skyblue;
  padding: 10px;
}
</style>