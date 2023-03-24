# 泛型工具类型——实现 Exclude

[挑战链接](https://github.com/type-challenges/type-challenges/blob/main/questions/00043-easy-exclude/README.zh-CN.md)

## 题目描述

实现一个泛型，接收两个参数，T，U。从联合类型T中排除U的类型成员，来构造一个新的类型。

## 测试用例

```ts
type Result = MyExclude<'a' | 'b' | 'c', 'a'> // 'b' | 'c'
```
## 思路分析

这里实现时需要先了解一个知识点，这个知识点是基于联合类型产生的，叫做`自动分发条件`。

当我们使用`T extends U ? X : Y`这个条件语句的时候，在遇到联合类型时，就会产生`自动分发条件`

比如 `T extends U ? X : Y`, T 可能是 `A | B` 的联合类型, 那实际情况就变成`(A extends U ? X : Y) | (B extends U ? X : Y)`

基于上面这个知识点，我们就可以来实现这个Exclude了。

但我们传入一个类型T，例如为：`1 | 2 | 3 | 4`, 一个类型U：`1 | 2`

此时依靠自动分发条件，就会对T中的每个类型进行对于U的`T extends U ? X : Y`进行判断

```ts
1 extends U ? X : 1  // X
2 extends U ? X : 2  // X
3 extends U ? X : 3  // 3
4 extends U ? X : 4  // 4
```

依据上面的代码，我们的答案就是`X | X | 3 | 4`,对于不需要的类型，我们可以把X用`never`代替即可，变成 `never | never | 3 | 4` 也就是`3 | 4` 

因此我们的代码就可以这么实现

```ts
type MyExclude<T, U> = T extends U ? never : T;  
```

同理，对于Extract工具，我们可以按照这个方法实现
```ts
type myExtract<T,U> = T extends U ? T : never;
```
