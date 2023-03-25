**ni** - 使用正确的包管理器
```
npm i -g @antfu/ni

ni
```
- 安装
```
ni
# npm install
# yarn install
# pnpm install
```

```
ni axios

# npm i axios
# yarn add axios
# pnpm i axios
```

```
ni @types/node -D

# npm i @types/node -D
# yarn add @types/node -D
# pnpm i @types/node -D
```

```
ni --frozen

# npm ci
# yarn install --frozen-lockfile
# pnpm install --frozen-lockfile
```

```
ni -g iroiro

# npm i -g iroiro
# yarn global add iroiro
# pnpm i -g iroiro

# this uses default agent, regardless your current working directory
```


# nr
- 跑

```
nr dev --port=3000

# npm run dev -- --port=3000
# yarn run dev --port=3000
# pnpm run dev -- --port=3000
```

```
nr

# interactively select the script to run
# supports https://www.npmjs.com/package/npm-scripts-info convention
```

```
nr -

# rerun the last command

```

**nx**
- 执行
```
nx jest

# npx jest
# yarn dlx jest
# pnpm dlx jest
```


# nu
- 升级
```
nu

# npm upgrade
# yarn upgrade
# pnpm upgrade
```

```
nu -i
# (not available for npm)
# yarn upgrade-interactive
# pnpm upgrade -i
```

# nci
- 干净安装
```
nci

# npm ci
# yarn install --frozen-lockfile
# pnpm install --frozen-lockfile
``` 
* 如果相应的节点管理器不存在，此命令将沿途全局安装它。


# nrm
- 消除
```
nrm axios

# npm uninstall axios
# yarn remove axios
# pnpm remove axios
nrm @types/node -D

# npm uninstall @types/node -D
# yarn remove @types/node -D
# pnpm remove @types/node -D
```

```
nrm -g iroiro

# npm uninstall -g iroiro
# yarn global remove iroiro
# pnpm remove -g iroiro

# this uses default agent, regardless your current working directory
```

# 更改目录
```shell
ni -C packages/foo vite
nr -C playground dev
```

# 配置
```js
; ~/.nirc

; fallback when no lock found
defaultAgent=npm # default "prompt"

; for global installs
globalAgent=npm
```
# 如何？
**ni**假设你使用锁文件（并且你应该）

它运行之前，它会检测你的
```
yarn.lock
```
/
```
pnpm-lock.yaml
```
/
```
package-lock.json
```
要知道当前包管理器，并运行相应的命令。