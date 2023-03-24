# 泛型工具类型——实现 Readonly 

[挑战链接](https://github.com/type-challenges/type-challenges/blob/main/questions/00007-easy-readonly/README.zh-CN.md)

## 题目描述

实现一个泛型，给定设置好的T，要求给T中的所有属性设置为只读，也就是挂载上`readonly`

## 测试样例

```ts
interface Todo {
  title: string
  description: string
}

const todo: MyReadonly<Todo> = {
  title: "Hey",
  description: "foobar"
}

todo.title = "Hello" // Error: cannot reassign a readonly property
todo.description = "barFoo" // Error: cannot reassign a readonly property
```

## 思路分析

我们可以枚举每一个属性，在挂载上readonly即可

具体做法就是，用`keyof T`获取到全部的属性，在用 `k in keyof T`枚举全部的属性，最后挂载上`readonly`
```ts
type MyReadonly<T> = {
  readonly [k in keyof T]: T[k]
}
```
