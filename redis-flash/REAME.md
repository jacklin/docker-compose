# 须设置Persistence 为Append Only File (AOF) - fsync every write 否则不建议使用于生产环境，由于容器启动到结束，内存中的数据将被清空

#使用本地驱动器
version: "3.7"
services:
  flash-redis:
    image: redislabs/redis
    volumes:
      - vdb-1:/var/opt
    ports:
     - 8443:8443
     - 12000-12099:12000-12099
    cap_add:
     - SYS_RESOURCE
    networks:
      - net-flash-redis
volumes:
  vdb-1:
    driver: local
networks:
  net-flash-redis:

# 使用目录挂载
# 需对 ./data 目录授权 chown -R 1000:1000 ./data  chmod 777 -R ./data
version: "3.7"
services:
  flash-redis:
    image: redislabs/redis
    privileged: true
    volumes:
      - ./data/redislabs/persist:/data/redislabs/persist:rw
      - ./data/redislabs/tmp:/data/redislabs/tmp:rw
      - ./data/redislabs/flash:/data/redislabs/flash:rw
    ports:
     - 8443:8443
     - 12000-12099:12000-12099
    cap_add:
     - SYS_RESOURCE
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 2.5G
        reservations:
          cpus: '0.25'
          memory: 2G
    networks:
      - net-flash-redis
networks:
  net-flash-redis:
#或者
version: "2.1"
services:
  flash-redis:
    image: redislabs/redis
    privileged: true
    volumes:
      - ./data/redislabs/persist:/data/redislabs/persist:rw
      - ./data/redislabs/tmp:/data/redislabs/tmp:rw
      - ./data/redislabs/flash:/data/redislabs/flash:rw
    ports:
     - 8443:8443
     - 12000-12099:12000-12099
    cap_add:
     - SYS_RESOURCE
    mem_limit: 4G
    memswap_limit: 8G
    networks:
      - net-flash-redis
networks:
  net-flash-redis: