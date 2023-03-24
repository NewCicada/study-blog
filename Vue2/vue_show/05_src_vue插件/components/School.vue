<template>
    <div>
        <h2>学校名称:{{ name }}</h2>
        <h2>学校地址:{{ address }}</h2>
        <button @click="test">点我测试一下hello方法</button>
    </div>
</template>

<script>
// import { HunHe, shareData } from '../mixin'
export default {
    // eslint-disable-next-line vue/multi-word-component-names
    name: 'School',
    data() {
        return {
            name: 'show',
            address: '惠州开发大学',
        }
    },
    methods: {
        test() {
            this.hello()
        },
    },
}
</script>
