<template>
    <div class="demo">
        <h2>学校名称:{{ name }}</h2>
        <h2>学校地址:{{ address }}</h2>
        <button @click="sendSchoolName">把学校名给APP</button>
    </div>
</template>

<script>
export default {
    // eslint-disable-next-line vue/multi-word-component-names
    name: 'School',
    props: ['getSchoolName'],
    data() {
        console.log(this)
        return {
            name: 'HuiZho',
            address: '惠州开发大学',
        }
    },
    methods: {
        sendSchoolName() {
            this.getSchoolName(this.name)
        },
    },
    props: ['getSchoolName'],
}
</script>
<style scoped>
/*scoped代表局部的*/
.demo {
    background: skyblue;
    padding: 5px;
}
</style>
