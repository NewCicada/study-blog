<template>
    <div>
        <h2 @click="showName">学生姓名:{{ name }}</h2>
        <h2>学生性别:{{ sex }}</h2>
    </div>
</template>

<script>
// import { HunHe, shareData } from '../mixin'
export default {
    // eslint-disable-next-line vue/multi-word-component-names
    name: 'Student',
    data() {
        return {
            name: '张三',
            sex: '男',
        }
    },
    // mixins: [HunHe, shareData],
}
</script>
