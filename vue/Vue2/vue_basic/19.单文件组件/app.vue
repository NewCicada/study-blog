<template>
    <div>
        <Student></Student>
        <School></School>
    </div>
</template>

<script>
// 引入组件
import Student from './Student.vue'
import School from './School.vue'
export default {
    name: 'App',
    components: {
        School,
        Student,
    },
}
</script>

<style></style>
