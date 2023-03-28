/opt/module/spark-3.1.1-yarn/bin/spark-submit \
--class 要运行的类名 \
--master yarn \
--deploy-mode client \
--driver-memory 2g \
--executor-memory 1g \
--executor-cores 2 \
/jar包的地址/这里是你的jar包

```shell
sh spark.sh
```
运行脚本