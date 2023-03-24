### 问题记录：在开发组件库时遇到了一个问题，如何在input框后面添加一个icon。

需求很简单，我们只需要用一个div包裹起来input和icon，接着来定位即可,代码如下。

```html
<div class="input-from">
  <input class="input" />
  <i class="icon">x</i>
</div>
```

具体操作就是在div中设置好`position:relative`，这样是让div里面的DOM可以脱离文档流，用`absolute`来定位。


```css
.input-from {
  position: relative;
}

.input {
}

.icon {
  position: absolute;
}
```

此时我们是看不到变化的，因为没有给div设置宽度，此时我们需要给div和input设置宽度，可以看到icon被挤下来了。
![image](https://user-images.githubusercontent.com/72189350/213375709-9eee2c99-3759-4a00-b34d-c0d37882ca38.png)

在通过`right:0`,将其icon设置在盒子最右边，在用`top:0`，在设定为在div同一层即可。

```css
.input-from {
  position: relative;
  width: 100px;
}

.input {
  width: inherit;
}

.icon {
  position: absolute;
  right: 0;
  top: 0;
}
```

此时还有一个细节，就是我们修改width时，需要div和input同时修改，才可以有这个效果，但是这样显然是非常麻烦，在组件库这样的组件显然是不合理的。

因此，我们可以用继承的功能，让input继承div的width即可。

```
.input-from {
  position: relative;
  width: 100px;
}

.input {
  width: inherit;
}

.icon {
  position: absolute;
  right: 0;
  top: 0;
}
```
这样就是一个合法的样式了,无论怎么修改，样式都是合法滴
![image](https://user-images.githubusercontent.com/72189350/213375475-bb4e4f4a-a9e9-4925-8a07-452359917894.png)

