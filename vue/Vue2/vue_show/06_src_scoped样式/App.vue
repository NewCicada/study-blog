<template>
    <div>
        <Student />
        <School />
    </div>
</template>

<script>
import Student from './components/Student.vue'
import School from './components/School.vue'
export default {
    name: 'App',
    components: { Student, School },
}
</script>
<style>
/* 
全局的样式是不需要加scoped 
全局共享
*/
.title {
    color: red;
}
</style>
