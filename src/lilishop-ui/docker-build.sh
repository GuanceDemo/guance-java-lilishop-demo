#代码目录
code_path=$PWD
REGISTRY_PATH='pubrepo.jiagouyun.com/demo'
BUILD_VERSION=4.2.4.1

docker build -t $REGISTRY_PATH/demo-lilishop-buyer-ui:$BUILD_VERSION ${code_path}/buyer
docker push $REGISTRY_PATH/demo-lilishop-buyer-ui:$BUILD_VERSION

docker build -t $REGISTRY_PATH/demo-lilishop-seller-ui:$BUILD_VERSION ${code_path}/seller
docker push $REGISTRY_PATH/demo-lilishop-seller-ui:$BUILD_VERSION

docker build -t $REGISTRY_PATH/demo-lilishop-manager-ui:$BUILD_VERSION ${code_path}/manager
docker push $REGISTRY_PATH/demo-lilishop-manager-ui:$BUILD_VERSION

