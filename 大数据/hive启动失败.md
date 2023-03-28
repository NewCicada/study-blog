启动hive后，在“hive>”输入“show databases；”报错：

FAILED:HiveException java.lang.RuntimeException： Unable to instantiate org.apache...
![](https://img-blog.csdnimg.cn/bc40b69bf9af40f0956a459a5ebac3fb.png)

搜索解决办法发现是要开启元数据：

- hive --service metastore 

* 开启时报错：
![](https://img-blog.csdnimg.cn/e9563fedd4014c18a5228358b04a7478.png)

解决办法发现要修改hive-site.xml的配置：

```xml
<property>
    <name>hive.metastore.schema.verification</name>
    <value>false</value>
  </property>
```
再次试图开启元数据：
```shell
hive --service metastore 
```
出现新的报错

MetaException(message:Required table missing : “DBS” in Catalog “” Schema “”. DataNucleus requires this table to perform its persistence operations. Either your MetaData is incorrect, or you need to enable “datanucleus.schema.autoCreateTables”)：
![](https://img-blog.csdnimg.cn/6c9a47cb36404e1f9637a992fd40bf15.png)
```xml
<property>
    <name>datanucleus.schema.autoCreateAll</name>
    <value>true</value>
 </property>
 ```
 再次修改配置后终于能开启元数据了：
```shell
hive --service metastore 
```
输入“show databases;”试试看：
![](https://img-blog.csdnimg.cn/07e82770381a410a88153ae864626ecd.png)