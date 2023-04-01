vue3加ts出现 --找不到模块“../views/admin/Pro/ProList.vue”或其相应的类型声明。ts(2307)

- vite、vue3、ts、pinia创建项目遇到这个问题，虽然可以正常运行，但是看着恶心
- 出现这个问题的原因是:ts只支持导出导入模块，但是vue不是模块，我们需要声明一下vue是个模块，ts可以导入。
- 问题解决方法:
- 在目录下env.d.ts文件中添加
- 目录下没有的话就创建一个
```typescript
declare module '*.vue' {
   import type { DefineComponent } from 'vue'
   const component: DefineComponent<{}, {}, any>
   export default component
}
或者
declare module '*.vue' {
   import type { DefineComponent } from 'vue'
   const component: ComponentOptions | ComponentOptions['setup']
   export default component
}
```
