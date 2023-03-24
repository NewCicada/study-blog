<template>
    <div>
        <h2 @click="showName">学校名称:{{ name }}</h2>
        <h2>学校地址:{{ address }}</h2>
    </div>
</template>

<script>
// import { HunHe, shareData } from '../mixin'
export default {
    // eslint-disable-next-line vue/multi-word-component-names
    name: 'School',
    data() {
        console.log(this)
        return {
            name: 'show',
            address: '惠州开发大学',
        }
    },
    // mixins: [HunHe, shareData],
    /* mounted() {
        console.log('你好啊!!!!')
    }, */
}
</script>

<style></style>
