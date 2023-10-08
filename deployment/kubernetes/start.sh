#!/bin/bash

# 为 kubernetes 节点 nodeName，注意必须由小写字母、数字，“-”或“.”组成，并且必须以小写字母或数字开头和结尾
master_node_name="node1"
master_host=127.0.0.1
master_port=22
master_user=root
master_ssh_pass=123456
# Kubelet 根目录
kubelet_root_dir="/var/lib/kubelet"
# docker容器存储目录
docker_storage_dir="/var/lib/docker"
# containerd容器存储目录
containerd_storage_dir="/var/lib/containerd"
# Etcd 数据根目录
etcd_data_dir="/var/lib/etcd"

changeVar() {
  tmp=$2
  read -p "请确认 $1 ,是不是 $2 (y/n) ": YES
  if [ $YES == y ]; then
    echo "默认路径，不需要修改..."
  else
    read -p "请输入你的$1": NEW_PATH
    tmp=$NEW_PATH
  fi
  echo $tmp
  # if [ ! -e $PUB_PATH ]; then
  #   mkdir -p $PUB_PATH
  # fi
}

inputVar() {
  tmp=$2
  read -p "请输入$1": NEW_PATH
  if [ -z NEW_PATH ]; then
    echo "请输入$1"
    tmp=$NEW_PATH
  fi
  echo $tmp
}

singleNode() {
  echo "单节点模式"
  master_host=$(changeVar "主节点名称(注意必须由小写字母、数字，“-”或“.”组成，并且必须以小写字母或数字开头和结尾)" $master_host)
  master_host=$(changeVar "主节点IP地址" $master_host)
  master_port=$(changeVar "主节点ssh端口" $master_port)
  master_user=$(changeVar "主节点用户名" $master_user)
  master_ssh_pass=$(changeVar "主节点用户密码" $master_ssh_pass)
  kubelet_root_dir=$(changeVar "Kubelet根目录" $kubelet_root_dir)
  docker_storage_dir=$(changeVar "docker容器存储目录" $docker_storage_dir)
  containerd_storage_dir=$(changeVar "containerd容器存储目录" $containerd_storage_dir)
  etcd_data_dir=$(changeVar "Etcd数据根目录" $etcd_data_dir)
  # ansible-playbook -i kubeadm-ha/example/hosts.allinone.ip.ini kubeadm-ha/90-init-cluster.yml
}

# GATEWAY_IP=$(changeVar "网关IP地址" $GATEWAY_IP)

# echo "当前网关IP地址为: $GATEWAY_IP"
# echo "当前文件系统主机IP为: $FDFS_HOST"
# echo "当前nacos连接的数据库IP和端口为: $MYSQL_HOST:$MYSQL_PORT"
# echo "预配置的网关地址为: $GATEWAY_IP"
# echo "请输入【y】或【n】..."
echo "----------------------------------"
echo "正在安装 Ansible 运行环境..."
echo "----------------------------------"
sh kubeadm-ha/ansible/install.sh


echo "----------------------------------"
echo "请选择安装kubernetes的节点分配模式:"
echo "(1) 单节点"
echo "(2) 单主多节点"
echo "(3) 多主多节点"
echo "(0) Exit Menu"
echo "----------------------------------"
read input
case $input in
  0)
  echo "退出菜单"
  exit;;
  1)
  sleep 1
  singleNode;;
  2)
  echo "单主多节点模式";;
  3)
  echo "多主多节点模式";;
esac

# read -p "请选择安装kubernetes类型": YES
# if [ $YES == y ]; then
#   echo "确认配置，执行下面步骤..."
# else
#   echo "没有确认配置，无法执行下面步骤，即将退出，请再次确认配置..."
#   exit 1
# fi

check() {
  if [ $? -eq 0 ]; then
    echo "this step is right, continue..."
    sleep 1
  else
    echo "this step has some problem,please check it..."
    sleep 1
    exit 1
  fi
}
