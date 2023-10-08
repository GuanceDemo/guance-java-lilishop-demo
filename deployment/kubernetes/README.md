# kubernetes


## 二进制方式安装

### [kubeasz](https://github.com/easzlab/kubeasz)

- **项目文件位于./kubeasz，如有疑问可参考[本地官方文档](./kubeasz/README.md)**
- 项目致力于提供快速部署高可用k8s集群的工具, 同时也努力成为k8s实践、使用的参考书；基于二进制方式部署和利用ansible-playbook实现自动化；既提供一键安装脚本, 也可以根据安装指南分步执行安装各个组件。
- **集群特性** `TLS`双向认证、`RBAC`授权、[多Master高可用](kubeasz/docs/setup/00-planning_and_overall_intro.md#ha-architecture)、支持`Network Policy`、备份恢复、[离线安装](kubeasz/docs/setup/offline_install.md)
- **集群版本** kubernetes v1.20, v1.21, v1.22, v1.23
- **操作系统** CentOS/RedHat 7, Debian 9/10, Ubuntu 16.04/18.04/20.04
- **运行时** docker 19.03.x, 20.10.x [containerd](kubeasz/docs/setup/containerd.md) v1.5.8
- **网络** [calico](kubeasz/docs/setup/network-plugin/calico.md), [cilium](kubeasz/docs/setup/network-plugin/cilium.md), [flannel](kubeasz/docs/setup/network-plugin/flannel.md), [kube-ovn](kubeasz/docs/setup/network-plugin/kube-ovn.md), [kube-router](kubeasz/docs/setup/network-plugin/kube-router.md)
- 以下为项目提供的官方安装指南。

**backup**
```sh
sudo vim /etc/ssh/sshd_config
...
PasswordAuthentication yes
ChallengeResponseAuthentication no
...
sudo systemctl restart sshd
```

#### [00-规划集群和配置介绍](./kubeasz/docs/setup/00-planning_and_overall_intro.md)

#### [01-创建证书和安装准备](./kubeasz/docs/setup/01-CA_and_prerequisite.md)

#### [02-安装etcd集群](./kubeasz/docs/setup/03-container_runtime.md)

#### [03-安装容器运行时](./kubeasz/docs/setup/03-container_runtime.md)

#### [04-安装master节点](./kubeasz/docs/setup/04-install_kube_master.md)

#### [05-安装node节点](./kubeasz/docs/setup/05-install_kube_node.md)

#### [06-安装集群网络](./kubeasz/docs/setup/06-install_network_plugin.md)

#### [07-安装集群插件](./kubeasz/docs/setup/07-install_cluster_addon.md)

## 一键安装

### [kubeadm-ha](https://github.com/TimeBye/kubeadm-ha)

- **项目文件位于./kubeadm-ha（执行命令需先进入目录），如有疑问可参考[本地官方文档](./kubeadm-ha/README.md)**
- [kubeadm-ha](https://github.com/TimeBye/kubeadm-ha) 使用 [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) 进行高可用 kubernetes 集群搭建，利用 ansible-playbook 实现自动化安装，既提供一键安装脚本，也可以根据 playbook 分步执行安装各个组件。
- **项目特性：** 不受国内网络限制、所有组件使用 `kubelet` 托管、多 `master` 高可用、`tls` 双向认证、自定义 `tls` 证书有效期、`RBAC` 授权、支持 `Network Policy`
- 以下为项目提供的官方安装指南。

#### [00-安装须知](./kubeadm-ha/docs/00-安装须知.md)

#### [01-集群安装](./kubeadm-ha/docs/01-集群安装.md)

注意：部署时，需确认`example/hosts.m-master.ip.ini`文件内信息

#### [02-节点管理](./kubeadm-ha/docs/02-节点管理.md)

#### [03-证书轮换](./kubeadm-ha/docs/03-证书轮换.md)

#### [04-集群升级](./kubeadm-ha/docs/04-集群升级.md)

#### [05-集群备份](./kubeadm-ha/docs/05-集群备份.md)

#### [06-集群恢复](./kubeadm-ha/docs/06-集群恢复.md)

#### [07-集群重置](./kubeadm-ha/docs/07-集群重置.md)

#### [08-离线安装](./kubeadm-ha/docs/08-离线安装.md)

#### [09-扩展阅读](./kubeadm-ha/docs/09-扩展阅读.md)

# [Helm(可选)](https://helm.sh/)


## 介绍

Helm 是 Kubernetes 的开源包管理器。它提供了共享和使用为 Kubernetes 构建的软件的能力。如需详细了解，请点击[Helm 官方文档](https://helm.sh/docs/)

## 安装

摘抄自[官方文档](https://helm.sh/docs/intro/install/)

### 脚本安装

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### 使用Apt (Debian/Ubuntu)

```bash
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

# 中间件

**确认项目路径为/root/docker/kubernetes(执行以下命令前，请确认是否处于相应目录)**
**如需修改默认路径，请执行脚本**
**集群部署hostpath能挂载宿主机仅限于node节点**
```bash
bash changePath.sh
```

## 创建namespace

**执行创建中间件前需要先执行**

**如非必要，请勿随便修改namespace,如需修改则要将所有yml文件的namespace全部替换**

```bash
kubectl apply -f middleware/lilishop-middleware.yml
```

## NFS

// TODO

## [MySQL](middleware/mysql/MySQL.md)

确认数据目录是否存在，如不存在则执行以下命令创建（如需修改路径路径，请看文档 中间件 标题下的说明）
```bash
mkdir -p /root/docker/kubernetes/data/middleware/mysql
```

### 单机

可直接使用 middleware/mysql/mysql.yml
```bash
kubectl apply -f  middleware/mysql/mysql.yml
```

**启动后，对外映射端口为 `30306`**

### 集群

可直接使用 middleware/mysql/mysql-cluster.yml
```bash
kubectl apply -f middleware/mysql/mysql-cluster.yml
```

## [Redis]()

确认数据目录是否存在，如不存在则执行以下命令创建（如需修改路径路径，请看文档 中间件 标题下的说明）
```bash
mkdir -p /root/docker/kubernetes/data/middleware/redis
```

### 单机

可直接使用 middleware/redis/redis.yml
```bash
kubectl apply -f middleware/redis/redis.yml
```

**启动后，对外映射端口为 `30379`**

### 集群

可直接使用 middleware/redis/redis-cluster.yaml
```bash
kubectl apply -f  middleware/redis/redis-cluster.yaml
```

## [RocketMQ]()

确认数据目录是否存在，如不存在则执行以下命令创建（如需修改路径路径，请看文档 中间件 标题下的说明）

```bash
mkdir -p /root/docker/kubernetes/data/middleware/rocketmq
```

**需修改文件内的两处brokerIP1为当前局域网ip或者公网ip**

**映射本地目录logs权限一定要设置为 777 权限，否则启动不成功**

### 部署

默认为一主一从

可直接使用 middleware/rocketmq/rocketmq-cluster.yml
```bash
kubectl apply -f  middleware/rocketmq/rocketmq-cluster.yml
```

**启动后，对外映射端口为 namesrv - `30876`、 broker - `30911`、 broker-slave - `30921`**

## [ELK]()

### ECK([ES官方推荐](./middleware/elasticsearch/eck/eck.md))

### Elasticsearch

确认数据目录是否存在，如不存在则执行以下命令创建（如需修改路径路径，请看文档 中间件 标题下的说明）
```bash
mkdir -p /root/docker/kubernetes/data/middleware/elasticsearch
```
#### 自定义单节点部署

可直接使用 middleware/elasticsearch/elasticsearch.yml
```bash
kubectl apply -f  middleware/elasticsearch/elasticsearch.yml
```

**映射本地目录logs权限一定要设置为 777 权限，否则启动不成功**

### Logstash

#### 简单部署

可直接使用 middleware/logstash/logstash.yml
```bash
kubectl apply -f  middleware/logstash/logstash.yml
```

### Kibana

#### 简单部署

可直接使用 middleware/kibana/kibana.yml
```bash
kubectl apply -f  middleware/kibana/kibana.yml
```

## [xxl-job]()

确认数据目录是否存在，如不存在则执行以下命令创建（如需修改路径路径，请看文档 中间件 标题下的说明）
```bash
mkdir -p /root/docker/kubernetes/data/middleware/xxl-job
```
### 部署

可直接使用 middleware/xxl-job/xxl-job.yml
```bash
kubectl apply -f  middleware/xxl-job/xxl-job.yml
```


## [nacos（适用微服务版本）]()

确认数据目录是否存在，如不存在则执行以下命令创建（如需修改路径路径，请看文档 中间件 标题下的说明）
```bash
mkdir -p /root/docker/kubernetes/data/middleware/nacos
```

### 简单部署

可直接使用 middleware/nacos/nacos.yml
```bash
kubectl apply -f  middleware/nacos/nacos.yml
```

### [nacos-operator](https://github.com/nacos-group/nacos-k8s/blob/master/operator/README-CN.md)

nacos-operator项目，快速在K8s上面部署构建nacos。

优点

- 通过operator快速构建nacos集群，指定简单的cr.yaml文件，既可以实现各种类型的nacos集群(数据库选型、standalone/cluster模式等)
- 增加一定的运维能力，在status中增加对nacos集群状态的检查、自动化运维等(后续扩展更多功能)

**[官方文档](https://github.com/nacos-group/nacos-k8s/blob/master/operator/README-CN.md)**

**[离线官方文档](./middleware/nacos/operator/README-CN.md)**

## [seata（适用微服务版本）]()

### 简单部署

可直接使用 middleware/nacos/nacos.yml

**如果不是部署环境，是局域网开发环境，需要将yml文件里 `SEATA_IP` 和 `SEATA_PORT` 部分注释解除，并将`SEATA_IP` 修改为部署服务器ip。将 `- port: 8091` 修改为 `- port: 30891`，将`containerPort: 8091` 修改为 `containerPort: 30891`**

```bash
kubectl apply -f  middleware/seata/seata-server.yml
```

**需修改文件内的ip**

# lilishop服务

## 镜像仓库

### 阿里云私有镜像仓库

**以下内容全部摘自[官方文档](https://help.aliyun.com/document_detail/86307.html)**

#### 创建私有镜像库

如果您是首次使用阿里云容器镜像服务，会弹出提示需要您设置Registry登录密码，请单击前往开通，并根据界面提示，设置Registry登录密码。

1. 登录[容器镜像服务控制台](https://cr.console.aliyun.com/?spm=a2c4g.11186623.0.0.466620fceD0suz)。

2. 在顶部菜单栏，选择所需地域。

3. 在左侧导航栏，选择**实例列表**。

4. 在**实例列表**页面单击个人版实例。

5. 在个人实例管理页面选择**仓库管理** > **镜像仓库**。

6. 在**镜像仓库**页面左上角选择**创建镜像仓库**。

7. 在仓库信息配置向导中设置**命名空间**、**仓库名称**、**摘要**和**仓库类型**，本例选择私有镜像仓库类型。然后单击**下一步**。

8. 在代码源配置向导中，将代码源设为**本地仓库**，然后单击创建**镜像仓库**。
> 在镜像仓库列表下，单击目标镜像仓库的名称。在基本信息页面的操作指南页签，可以查看如何使用该私有镜像仓库。

9. 执行以下命令，登录镜像仓库。
> 说明
> * 如果您使用的是阿里云账号，阿里云账号就是您的镜像仓库登录名。
> * 如果您使用的是RAM用户，去掉RAM用户账号.onaliyun.com后的名称就是您的镜像仓库登录名。例如您的RAM用户为123@1880770869021234.onaliyun.com，则您的镜像仓库登录名为 123@1880770869021234。

```
sudo docker login --username=<镜像仓库登录名> registry.cn-<个人版实例所在的地域>.aliyuncs.com
```

返回结果中输入登录密码，然后显示login succeeded，表示登录成功。

10. 执行以下命令，查看镜像ID。

```sh
docker images     
```

11.  执行以下命令，设置镜像标签。

```sh
sudo docker tag <镜像ID> registry.cn-hangzhou.aliyuncs.com/<命名空间名称>/<镜像仓库名称>：[镜像版本号]
```

12. 执行以下命令，推送镜像至镜像仓库。

```sh
sudo docker push registry.cn-hangzhou.aliyuncs.com/<命名空间名称>/<镜像仓库名称>：[镜像版本号]
```

预期输出：

```sh
The push refers to a repository [registry.cn-hangzhou.aliyuncs.com/XXX/tomcat-private]
9072c7b03a1b: Pushed
f9701cf47c58: Pushed
365c8156ff79: Pushed
2de08d97c2ed: Pushed
6b09c39b2b33: Pushed
4172ffa172a6: Pushed
1dccf0da88f3: Pushed
d2070b14033b: Pushed
63dcf81c7ca7: Pushed
ce6466f43b11: Pushed
719d45669b35: Pushed
3b10514a95be: Pushed
V1: digest: sha256:cded14cf64697961078aedfdf870e704a52270188c8194b6f70c778a8289**** size: 2836
```


在镜像仓库详情页，单击左侧导航栏中的镜像版本，您可以看到镜像已成功上传，并可查看镜像的版本信息。

### 私有库部署

#### docker方式(简单启动)

```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

**部署完成后得到私有库地址 例如：192.168.0.108:5000**

#### kubernets方式

##### 存储目录准备

###### 本地挂载

在任一节点服务器创建目录并挂载在其他节点（如为单节点则不需要挂载）

```bash
# 在一节点创建目录
sudo mkdir /opt/certs /opt/registry 
# 在其他节点挂载
sudo mount 192.168.1.40:/opt/certs /opt/certs 
sudo mount 192.168.1.40:/opt/registry /opt/registry
```

如需nfs方式存储可参考 [中间件 nfs](#nfs) 部分

##### 生成自签名证书

在生成目录节点生成自签名证书

```bash
cd /opt 
sudo openssl req -newkey rsa:4096 -nodes -sha256 -keyout \
 ./certs/registry.key -x509 -days 365 -out ./certs/registry.crt
```

到相关目录验证

```bash
[kadmin@k8s-master opt]$ ls -l certs/
total 8
-rw-r--r--. 1 root root 2114 Sep 26 03:26 registry.crt
-rw-r--r--. 1 root root 3272 Sep 26 03:26 registry.key
```

##### 部署私用库

在本项目的kubernetes目录下执行

```bash
kubectl apply -f private-registry.yaml
```

检查是否部署成功

```bash
[kadmin@k8s-master ~]$ kubectl get deployments private-repository-k8s
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
private-repository-k8s   1/1     1            1           3m32s
[kadmin@k8s-master ~]$
[kadmin@k8s-master ~]$ kubectl get pods | grep -i private-repo
private-repository-k8s-85cf76b9d7-qsjxq   1/1     Running   0          5m14s
[kadmin@k8s-master ~]$
```

**部署完成后得到私有库地址 例如：192.168.0.108:31320**

### 更新docker配置 （只需在编译上传的节点修改）

**如未安装docker，可参考[docker安装](#Docker)**

> xxx.xxx.xxx.xxx 为局域网ip
> 5000 为docker方式启动的端口
> 31320 为kubernetes方式启动端口

* __编辑 /etc/docker/daemon.json 文件__

```
{
   ...
   "insecure-registries": ["xxx.xxx.xxx.xxx:xxxx"]
}
```


修改完成后执行

```
systemctl restart docker
```

### 更新 contarinerd 配置 （在所有节点上修改）

* __关闭对于当前局域网ip:port的安全验证；编辑 /etc/containerd/config.toml__

```
...
[plugins."io.containerd.grpc.v1.cri".registry]

      [plugins."io.containerd.grpc.v1.cri".registry.configs]

        [plugins."io.containerd.grpc.v1.cri".registry.configs."xxx.xxx.xxx.xxx:xxxx"]

          [plugins."io.containerd.grpc.v1.cri".registry.configs."xxx.xxx.xxx.xxx:xxxx".tls]
            insecure_skip_verify = true
...

```

修改完成后执行

```
systemctl daemon-reload && systemctl restart containerd
```

### 创建docker-registry访问密钥(非必需)

```
kubectl create secret docker-registry SECRET_NAME --docker-server=https://index.docker.io/v1/ --docker-username=YOUR_USERNAME --docker-password='YOUR_PASSWORD' --docker-email='YOUR_EMAIL'
```

设置完成后，则需要修改相应的yml文件，将`SECRET_NAME`填写到 *spec -> imagePullSecrets -> name*中 ，示例如下：

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: buyer-ui
spec:
  selector:
    matchLabels:
      app: buyer-ui
  template:
    metadata:
      labels:
        app: buyer-ui
    spec:
      imagePullSecrets:
        - name: SECRET_NAME
      containers:
        - name: buyer-ui
          image: 192.168.0.108:31320/buyer-ui:4.2.4.1
          ports:
            - containerPort: 10000
```

## 后端服务

### 编译环境

#### JDK

##### 下载

官网下载：https://www.oracle.com/java/technologies/downloads/

* 上传到服务器任意目录解压

```bash
sudo tar -xvf jdk-17.0.6_linux-x64_bin.tar.gz -C /opt
```

##### 设置环境变量

* 编辑文件

```shell
sudo vim /etc/profile
```

* 文件末尾添加如下内容

```bash
export JAVA_HOME=/opt/jdk-17.0.6
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```

* 重新载入配置文件

```shell
source /etc/profile
```

#### Maven

##### 下载

官网下载：https://maven.apache.org/download.cgi

* 上传到服务器任意目录解压

```bash
sudo tar -xvf apache-maven-3.8.6-bin.tar.gz -C /opt
```

##### 设置环境变量

* 编辑文件

```shell
sudo vim /etc/profile
```

* 文件末尾添加如下内容

```bash
export M2_HOME=/opt/apache-maven-3.8.6
export PATH=$M2_HOME/bin:$PATH
```

* 重新载入配置文件

```shell
source /etc/profile
```

##### 修改 Maven 配置文件

```
        <!-- 阿里云仓库 -->
        <mirror>
            <id>alimaven</id>
            <mirrorOf>central</mirrorOf>
            <name>aliyun maven</name>
            <url>https://maven.aliyun.com/repository/central</url>
        </mirror>
        <!-- 中央仓库1 -->
        <mirror>
            <id>repo1</id>
            <mirrorOf>central</mirrorOf>
            <name>Human Readable Name for this Mirror.</name>
            <url>http://repo1.maven.org/maven2/</url>
        </mirror>
        <!-- 中央仓库2 -->
        <mirror>
            <id>repo2</id>
            <mirrorOf>central</mirrorOf>
            <name>Human Readable Name for this Mirror.</name>
            <url>http://repo2.maven.org/maven2/</url>
        </mirror>
```

#### Docker

##### ubuntu 20.04

```bash
sudo apt install containerd
sudo apt install docker.io
```

#### 备选下载地址

**内附JDK、Maven**
  
百度云: https://pan.baidu.com/s/16jbbWh6bevggdijp9YhggQ?pwd=u6dd 提取码: u6dd

### 构建镜像

* **执行目录在后端项目根目录**

* **确定本地配置文件的配置为对应运行环境的配置(如是经过上面方式部署的中间件且没有修改过namespace，则不需要修改)**

* **修改原创库地址在项目跟目录的pom.xml文件中 properties -> docker-registry**

> **如为私有库则 docker-registry 为私有库最后部署的 局域网ip:端口的形式， 如 192.168.0.108:31320**

> **如为公有库则 docker-registry 为公有库的地址，则必须 `docker login` 过或者使用[访问密钥](#创建docker-registry访问密钥非必需)。格式为 registry.cn-<region>.aliyuncs.com/<命名空间名称> 如 registry.cn-beijing.aliyuncs.com/lili-images**


#### 本地docker镜像

```bash
mvn clean package docker:build -DskipTests
```

#### 本地docker镜像并推送到远程docker库

```bash
mvn clean package docker:build -DskipTests -DpushImage
``` 

### 快速启动(标准版)

可直接使用 service/deploy-api.yml

* 注意：必需修改deploy-api.yml 的 镜像地址
* 私有库示例： 192.168.0.108:31320
* 公有库示例： registry.cn-beijing.aliyuncs.com/lili-images

```bash
kubectl apply -f service/deploy-api.yml
```

### 快速启动(微服务版)

可直接使用 service/deploy-micro-api.yml

* 注意：必需修改deploy-api.yml 的 镜像地址
* 私有库示例： 192.168.0.108:31320
* 公有库示例： registry.cn-beijing.aliyuncs.com/lili-images

```bash
kubectl apply -f service/deploy-micro-api.yml
```


## 前端服务

* **执行目录在前端项目根目录**

* **确定本地配置文件的配置为对应运行环境的配置。（每个项目的config.js）如:buyer/public/config.js**

### tls


```
kubectl create secret tls my-tls-secret \
  --cert=path/to/cert/file \
  --key=path/to/key/file
```

### 构建镜像

* **执行项目根目录的docker-build.sh脚本，构建镜像（如需修改版本号，进入修改）**

> **如为私有库则 docker-registry 为私有库最后部署的 局域网ip:端口的形式， 如 192.168.0.108:31320**

> **如为公有库则 docker-registry 为公有库的地址，则必须 `docker login` 过或者使用[访问密钥](#创建docker-registry访问密钥非必需)。格式为 registry.cn-<region>.aliyuncs.com/<命名空间名称> 如 registry.cn-beijing.aliyuncs.com/lili-images**

