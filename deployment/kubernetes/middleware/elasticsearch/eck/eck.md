# ECK([ES官方推荐](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html))

以下内容全部摘抄自[官方文档](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html)

## 介绍

Elastic Cloud on Kubernetes (ECK) 基于 Kubernetes Operator 模式构建，扩展了基本的 Kubernetes 编排功能，以支持在 Kubernetes 上设置和管理 Elasticsearch、Kibana、APM Server、Enterprise Search、Beats、Elastic Agent 和 Elastic Maps Server。

## 安装

### YAML

#### Install custom resource definitions

```bash
kubectl create -f https://download.elastic.co/downloads/eck/2.1.0/crds.yaml
```

#### Install the operator with its RBAC rules

```bash
kubectl apply -f https://download.elastic.co/downloads/eck/2.1.0/operator.yaml
```

#### Monitor the operator logs

```bash
kubectl -n elastic-system logs -f statefulset.apps/elastic-operator
```

### Helm

**Helm 最小支持版本 3.2.0.**

```bash
helm repo add elastic https://helm.elastic.co
helm repo update
helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace
```

## 运行Elasticsearch

可直接使用示例文件 middleware/elasticsearch/eck/example/elasticsearch-example.yml（默认为两个节点，一个主节点，一个数据节点，且节点数量为1。如需修改数量，请修改文件中的count数量）
```bash
kubectl apply -f  middleware/elasticsearch/eck/example/elasticsearch-example.yml
```

公开端口为 30920
文件仅供参考，实际运行还需根据自身环境灵活设置，详细设置请参考[官方文档](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-node-configuration.html)

## 运行Kibana

可直接使用示例文件 middleware/elasticsearch/eck/example/kibana-example.yml
```bash
kubectl apply -f  middleware/elasticsearch/eck/example/kibana-example.yml
```

获取es默认用户 elastic 的密码的方式
```bash
kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'
```

公开端口为 30601
文件仅供参考，实际运行还需根据自身环境灵活设置，详细设置请参考[官方文档](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-node-configuration.html)

