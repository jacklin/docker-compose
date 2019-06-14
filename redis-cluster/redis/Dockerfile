FROM redis:5.0

MAINTAINER lin Jiancheng <jacklin@shouyiren.net>

#修复时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
EXPOSE 6379
ADD redis.conf /etc/redis/redis.conf
RUN chown redis:redis /etc/redis/redis.conf
#环境变量
ENV REQUIREPASS 123456
ENV MASTERAUTH 123456
ENV PORT 6379
ENV DAEMONIZE yes
ENV DBFILENAME dump

COPY redis-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/redis-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/redis-entrypoint.sh"]