#!/bin/sh
#生成私钥
openssl genrsa -out san_domain_com.private.key 2048
#拷贝一个不需要输入密码的密钥文件(公钥)
openssl rsa -in san_domain_com.private.key -out san_domain_com.public.key
#创建CSR文件
openssl req -new -out san_domain_com.csr -key san_domain_com.private.key -config openssl.cnf
#查看CSR
openssl req -text -noout -in san_domain_com.csr
#自签名并创建证书
openssl x509 -req -days 3650 -in san_domain_com.csr -signkey san_domain_com.private.key -out san_domain_com.crt -extensions v3_req -extfile openssl.cnf
