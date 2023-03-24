<template>
    <div>
        <Test />
        <Test2 />
        <Test3 />
    </div>
</template>

<script>
import Test from './components/test.vue'
import Test2 from './components/test2.vue'
import Test3 from './components/test3'

export default {
    name: 'App',
    components: { Test, Test2, Test3 },
}
</script>
