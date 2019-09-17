#使用Nginx+php7.1.2-fpm
#添加环境变量
#environment:
#  - "RUN_ENV=product"
#  - "DB_MYSQL_HOST=lb-db"
#  - "DB_REDIS_HOST=lb-db-redis"
#启动服务
docker-compose up --scale nginx=2 --scale php-fpm=4 -d


#服务使用端口
8090 web服务端口
5669 lb-监听端口
