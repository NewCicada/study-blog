* 对于很多新接触前端项目的小伙伴，刚开始对项目所需要的包的安装命令比较陌生，下面我进行区分：

* 首先时开发环境的包，即只是我们在进行开发的时候需要的依赖，比如eslint，vue-cli，sass，less等等；

* 在生产环境时的依赖是指项目在上线后，依旧需要的依赖，比如vue，vue-router，vuex，axios，element-ui等等；

* 那么安装开发环境依赖和生产环境依赖的命令分别是什么呢？

* 在我们的vue项目中的package.json文件中，"dependencies"配置对象即是生产环境所需要的依赖，"devDependencies"配置对象则是开发环境所需要的依赖；

- 那么安装依赖的命令分别是：
```shell
dependencies生产环境：npm i --save 依赖名；可简写为：npm i -S 依赖名；
```

```shell
devDependencies开发环境：npm i --save-dev 依赖名；可简写为：npm i -D 依赖名。

```

- 补充：npm i -g xxx 为全局安装，安装到磁盘。