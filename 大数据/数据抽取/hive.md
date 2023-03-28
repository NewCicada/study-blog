启动Hive Metastore服务
Spark读写Hive表，需要访问Metastore服务。在终端中执行如下命令：
```shell
$ hive --service metastore
```
这将保持Hive Metastore服务一直运行，请勿关闭终端。如果要将其作为后台服务启动，则可以使用下面的命令：
```shell
$ nohup hive --service metastore &
```
这个命令将启动Hive Metastore服务，并在后台持续运行。