#步骤一：
#创建外部网络
docker network create net-app-internal
#步骤二：
#启动mysql服务
注:需要先启动 db1 ,再对整个集群启动 docker-compose up db1
所有节点使用mysqld5.7
docker-compose up db1 -d
docker-compose up
#步骤三：
#启动web服务，例如：
docker-compose up --scale nginx=2 --scale php-fpm=4

#服务使用端口
8087 lb-监听端口
3306 数据库连接端口 注：默认不开放
8088 数据库管理端口 注：服务上线后建议关闭 dock-compose stop adminer-db