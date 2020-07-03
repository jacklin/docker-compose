#这个docker集群基于 docker swarm 创建支持跨主机添加节点
#新加节点(主机)需安装docker 与docker-compose
~
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
$ sudo yum install -y yum-utils

$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
$ sudo yum install docker-ce docker-ce-cli containerd.io
$ sudo systemctl start docker
$ sudo systemctl enable docker
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
$ docker-compose --version
~
#修改配置
echo “vm.max_map_count=262144” > /etc/sysctl.conf
sysctl -p
#Dcoker Swarm 集群部署
#1.初始化管理节点
docker swarm init --advertise-addr 192.168.50.90
docker swarm join --token SWMTKN-1-084gpzhwfvq88cx3ebsy856oq5kabw8fug1igkbml2868dgmk7-8v80t7qd1p1ieu99bkwjnhnmu 192.168.50.90:2377
