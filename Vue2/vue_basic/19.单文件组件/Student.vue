<template>
    <!-- 组件的结构 -->
    <div class="demo">
        <h2>学生姓名:{{ name }}</h2>
        <h2>学校地址:{{ age }}</h2>
    </div>
</template>
<script>
// 组件交互相关的代码(数据、方法等等)e
export default {
    name: 'Student',
    data() {
        return {
            schoolName: '张三',
            address: '18',
        }
    },
}
</script>
