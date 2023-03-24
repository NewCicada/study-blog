# 泛型工具类型——实现 Pick

[挑战链接](https://github.com/type-challenges/type-challenges/blob/main/questions/00004-easy-pick/README.zh-CN.md)

### 题目描述

实现一个泛型，给定一个设置好的类型T，传入另一个类型U，要求把T中的对应的U中的类型返回回去。

### 测试样例
```ts
interface Todo {
  title: string
  description: string
  completed: boolean
}

type TodoPreview = MyPick<Todo, 'title' | 'completed'>

const todo: TodoPreview = {
    title: 'Clean room',
    completed: false,
}
```

### 思路分析

题目要求很容易，其实我们只需要枚举类型T，放回对应的键值类型即可。

这里我们需要用到的语法是

- `keyof` 获取T类型键值的联合类型
- `extends` 约束U的联合类型必须包含在T的联合类型中
- `in` 枚举U的类型

```ts
type MyPick = <T, U extends keyof T> {
  [k in U]: T[k]
}
```
