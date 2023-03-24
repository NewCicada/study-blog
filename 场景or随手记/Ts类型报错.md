### 情况1：元素隐式具有“any” 类型，因为索引表达式的类型不为‘number‘

要求：要在DOM元素上的style挂载key值，也就是给DOM元素增加样式，

```typescript
dom.style[key] = styles[key]; // 飘红

(dom.style as any)[key] = styles[key]; 解决
```

### 情况2：元素隐式具有 "any" 类型，因为类型为 "string" 的表达式不能用于索引类型 "{}"。在类型 "{}" 上找不到具有类型为 "string" 的参数的索引签名

要求，要定义一个对象，key为string，可以接收各种类型的值。

```typescript
interface objType {
  [propName: string]: any;
}

const arr: objType = {};
```

### 情况3：vue3用provide向子节点注入一个函数，在子组件用inject接收到这个函数，在我使用这个函数时，ts发送了报错，函数的类型为“未知”

```typescript
// 父组件
provide("toggle-change", toggleChange);


//子组件
const toggleChange = inject<() => void>("toggle-change", () => {});
toggleChange()
```

如果需要传递参数的话，发生了应有 0 个参数，但获得 1 个，解决办法如下
```typescript
const toggleChange = inject<(param: any) => void>("toggle-change", () => {});
toggleChange(item)
```

