#!/bin/sh

#更新
sudo apt update && sudo apt upgrade -y

#安装依赖工具
sudo apt install -y ca-certificates curl gnupg

#添加Docker官方GPG密钥
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#添加Docker仓库
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 替换仓库地址为阿里云镜像
#echo "deb [arch=$(dpkg --print-architecture)] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $VERSION_CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update

#安装Docker引擎
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#配置非root用户权限
sudo usermod -aG docker $USER
newgrp docker
