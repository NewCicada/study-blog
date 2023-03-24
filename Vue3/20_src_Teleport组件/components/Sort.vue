<template>
  <div class="son">
    <h3>我是Son组件</h3>
    <Dialog />
  </div>
</template>

<script>
import Dialog from './Dialog'
export default {
  name: 'SoRt',
  // eslint-disable-next-line vue/no-unused-components
  components: { Dialog },
}
</script>

<style>
.son {
  background-color: rgb(45, 172, 17);
  padding: 10px;
}
</style>