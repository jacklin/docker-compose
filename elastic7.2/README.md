#创建多docker-compose互通网络步骤
#### 创建共通网络 app_net
1.docker network create app_net
2.在每个docker-compose.yml中添加
~~
external:
  name: app_net
~~
例如：
项目1：docker-compose.yml如下
~~
...
networks:
  custom_net1:
   external:
      name: app_net
~~
项目2：docker-compose.yml如下
~~
...
networks:
  custom_net2:
   external:
      name: app_net
~~