#启动本实例注意事项
1、先启动zookeeper服务
2、修改docker-compose.yml中配置的
canal-adapter 配置环境变量：
CANAL_ZOOKEEPERHOSTS: "zookeeper:2181"
canal-server 配置环境变量：
CANAL_ADMIN_REGISTER_AUTO: "true"   //启动自动注册
CANAL_ADMIN_REGISTER_CLUSTER: "test" //注册集群
#管理canal与instance
1、登录canal-admin
创建集群
集群名为：test
ZK地址为：zookeeper:2181
2、修改集群主配置
添加zkServers
canal.zkServers = zookeeper:2181
注释原有
\\#canal.instance.global.spring.xml = classpath:spring/file-instance.xml
去掉注释：
canal.instance.global.spring.xml = classpath:spring/default-instance.xml
3、创建instance
所属集群：test 名称为：example
