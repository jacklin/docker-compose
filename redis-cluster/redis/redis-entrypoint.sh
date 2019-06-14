#!/bin/sh

sed -i "s/\$MASTERAUTH/$MASTERAUTH/g" /etc/redis/redis.conf
sed -i "s/\$REQUIREPASS/$REQUIREPASS/g" /etc/redis/redis.conf
sed -i "s/\$PORT/$PORT/g" /etc/redis/redis.conf
sed -i "s/\$DAEMONIZE/$DAEMONIZE/g" /etc/redis/redis.conf
sed -i "s/\$DBFILENAME/$DBFILENAME/g" /etc/redis/redis.conf

exec redis-server /etc/redis/redis.conf