### 情况一：Injection "xxxx" not found

目标：我想在没有组件 B 的情况下使用组件 A 时，此警告会显示在控制台上

```typescript
// 为避免警告，可以指定一个默认值（ 的第二个参数inject()）：
const test = inject<Function>('test', () => {})
```
