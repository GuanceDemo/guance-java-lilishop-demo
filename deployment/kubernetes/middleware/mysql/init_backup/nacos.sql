/*
 Navicat Premium Data Transfer
 
 Source Server         : lili-mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : 192.168.0.116:3306
 Source Schema         : nacos
 
 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001
 
 Date: 24/02/2022 11:24:44
 */
create database nacos;

use nacos;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;

CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin,
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`, `group_id`, `tenant_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 234 DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = 'config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    1,
    'application-dev.yml',
    'DEFAULT_GROUP',
    'management:
  health:
    db:
      enabled: false
server:
  servlet:
    context-path: /

  tomcat:
    uri-encoding: UTF-8
    threads:
      min-spare: 50
      max: 1000
# 数据源
spring:
  boot:
    admin:
      client:
        url: http://127.0.0.1:8000
  main: 
    allow-bean-definition-overriding: true
    # allow-circular-references: true
  cloud:
    #sentinel配置
    sentinel:
      transport:
        port: 8719
        dashboard: 192.168.0.108:30280
    #避免nacos取网卡出错
    inetutils:
      preferred-networks: 192.168.1
    nacos:
      discovery:
        failure-tolerance-enabled: true
  cache:
    type: redis
  mvc:
    pathmatch:
      matching-strategy: ANT_PATH_MATCHER
  # Redis
  redis:
    host: redis-service.lilishop-middleware
    port: 6379
    password: lilishop
    lettuce:
      pool:
        # 连接池最大连接数（使用负值表示没有限制） 默认 8
        max-active: 200
        # 连接池最大阻塞等待时间（使用负值表示没有限制） 默认 -1
        max-wait: 20
        # 连接池中的最大空闲连接 默认 8
        max-idle: 10
        # 连接池中的最小空闲连接 默认 8
        min-idle: 8
  # 文件大小上传配置
  servlet:
    multipart:
      max-file-size: 20MB
      max-request-size: 20MB
  jackson:
    time-zone: GMT+8
    serialization:
      #关闭jackson 对json做解析
      fail-on-empty-beans: false

# Swagger界面内容配置
swagger:
  title: lilishop API接口文档
  description: lilishop Api Documentation
  version: 4.2.4
  termsOfServiceUrl: https://pickmall.cn
  contact:
    name: lili
    url: https://pickmall.cn
    email: admin@pickmall.com

# Mybatis-plus
mybatis-plus:
  mapper-locations: classpath*:mapper/*.xml
  configuration:
    #缓存开启
    cache-enabled: true
    #日志
#    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl

# 日志
logging:
  # 输出级别
  level:
    # root: debug
    cn.lili: debug
    com.alibaba.nacos.client.*: WARN
    # io.seata: debug
  #    org.hibernate: debug
  #    org.springframework: debug
  #    org.springframework.data.mongodb.core: debug
  file:
    # 指定路径
    path: logs
  logback:
    rollingpolicy:
      # 最大保存天数
      max-history: 7
      # 每个文件最大大小
      max-file-size: 5MB
#加密参数
jasypt:
  encryptor:
    password: lili


lili:
  #验证码设置
  verification-code:
    #图形验证码有效时间 秒 包含滑块验证码有效时间， 以及验证通过之后，缓存中存储的验证结果有效时间
    effectiveTime: 300
    #水印
    watermark: LILI-SHOP
    #干扰项数量 最大2 默认0
    interfereNum: 1
    #允许误差像素
    faultTolerant: 3
  #短信模版配置
  sms:
    #登录
    LOGIN: SMS_205755300
    #注册
    REGISTER: SMS_205755298
    #找回密码
    FIND_USER: SMS_205755301
    #设置密码
    UPDATE_PASSWORD: SMS_205755297
    #支付密码
    WALLET_PASSWORD: SMS_205755301
  system:
    isDemoSite: false
    isTestModel: true
  #     脱敏级别：
  #     0：不做脱敏处理
  #     1：管理端用户手机号等信息脱敏
  #     2：商家端信息脱敏（为2时，表示管理端，商家端同时脱敏）
  #    sensitiveLevel: 2

  statistics:
    # 在线人数统计 X 小时。这里设置48，即统计过去48小时每小时在线人数
    onlineMember: 48
    # 当前在线人数刷新时间间隔，单位秒，设置为600，则每10分钟刷新一次
    currentOnlineUpdate: 600
  #qq lbs 申请
  lbs:
    key: 4BYBZ-7MT6S-PUAOA-6BNWL-FJUD7-UUFXT
    sk: zhNKVrJK6UPOhqIjn8AQvG37b9sz6
  #域名
  domain:
    pc: http://192.168.0.116:8888
    wap: http://192.168.0.116:8888
    seller: http://192.168.0.116:8888
    admin: http://192.168.0.116:8888
  #api地址
  api:
    buyer: https://z171l91606.51mypc.cn
    base: http://192.168.0.116:8888
    manager: http://192.168.0.116:8888
    seller: http://192.168.0.116:8888

  # jwt 细节设定
  jwt-setting:
    # token过期时间（分钟）
    tokenExpireTime: 30000

  # 使用Spring @Cacheable注解失效时间
  cache:
    # 过期时间 单位秒 永久不过期设为-1
    timeout: 1500
  #多线程配置
  thread:
    corePoolSize: 5
    maxPoolSize: 50
    queueCapacity: 50
  data:
    elasticsearch:
      cluster-name: elasticsearch
      cluster-nodes: elasticsearch.lilishop-middleware:9200
      index:
        number-of-replicas: 0
        number-of-shards: 3
      index-prefix: lili
      schema: http
    #      account:
    #        username: elastic
    #        password: LiLiShopES

    logstash:
      server: logstash-service.lilishop-middleware:4560
    rocketmq:
      promotion-topic: lili_promotion_topic
      promotion-group: lili_promotion_group
      msg-ext-topic: lili_msg_topic
      msg-ext-group: lili_msg_group
      goods-topic: lili_goods_topic
      goods-group: lili_goods_group
      order-topic: lili_order_topic
      order-group: lili_order_group
      member-topic: lili_member_topic
      member-group: lili_member_group
      other-topic: lili_other_topic
      other-group: lili_other_group
      notice-topic: lili_notice_topic
      notice-group: lili_notice_group
      notice-send-topic: lili_send_notice_topic
      notice-send-group: lili_send_notice_group
      after-sale-topic: lili_after_sale_topic
      after-sale-group: lili_after_sale_group
      store-topic: lili_store_topic
      store-group: lili_store_group
rocketmq:
  name-server: rocketmq.lilishop-middleware:9876
  isVIPChannel: false
  producer:
    group: lili_group
    send-message-timeout: 30000

xxl:
  job:
    admin:
      addresses: http://xxl-job-service.lilishop-middleware:9001/xxl-job-admin
    executor:
      appname: xxl-job-executor-lilishop
      address:
      ip:
      port: 8891
      logpath: ./xxl-job/executor
      logretentiondays: 7
feign:
  client:
    config:
      default:
        connectTimeout: 500000
        readTimeout: 500000
        loggerLevel: basic
  inside:
    key: mall4cloud-feign-inside-key
    secret: mall4cloud-feign-inside-secret
    # ip白名单，如果有需要的话，用小写逗号分割
    ips: 
  circuitbreaker:
    enabled: true
  sentinel:
    default-rule: default # 全局规则名称
    rules:
         # 全局配置，这些参数的意思请查看 com.alibaba.csp.sentinel.slots.block.degrade.DegradeRule
         # 可配置多条规则
        default:
          - grade: 2
            count: 1
            timeWindow: 1
            statIntervalMs: 1000
            minRequestAmount: 5
          - grade: 2
            count: 1
         # 针对 user FeignClient
        user:
          - grade: 2
            count: 1
            timeWindow: 1
            statIntervalMs: 1000
            minRequestAmount: 5
seata:
  # application-id: ${spring.application.name}
  enabled: true
  # 启用自动数据源代理
  enable-auto-data-source-proxy: false
  # use-jdk-proxy: false
  # Seata 的注册方式为 nacos
  registry:
    type: nacos
    nacos:
      server-addr: nacos.lilishop-middleware:8848
      group: SEATA_GROUP
      namespace: 4b304983-50ff-41cc-985a-dca6c98caad1
      username: nacos
      password: nacos
  # Seata 的配置中心为 nacos
  config:
    type: nacos
    nacos:
      serverAddr: nacos.lilishop-middleware:8848
      group: SEATA_GROUP
      dataId: seataServer.properties
      namespace: 4b304983-50ff-41cc-985a-dca6c98caad1
      username: nacos
      password: nacos',
    'de1057748507d14700b53828f6ba4f8d',
    '2022-05-09 03:28:11',
    '2023-02-24 01:58:11',
    'nacos',
    '192.168.0.98',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    2,
    'gateway-dev.yml',
    'DEFAULT_GROUP',
    'spring:
  redis:
    host: redis-service.lilishop-middleware
    port: 6379
    password: lilishop
    lettuce:
      pool:
        # 连接池最大连接数（使用负值表示没有限制） 默认 8
        max-active: 200
        # 连接池最大阻塞等待时间（使用负值表示没有限制） 默认 -1
        max-wait: 20
        # 连接池中的最大空闲连接 默认 8
        max-idle: 10
        # 连接池中的最小空闲连接 默认 8
        min-idle: 8
  cloud:
    gateway:
      globalcors:
        cors-configurations:
          \'[/**]\':
            allow-credentials: true
            allowed-headers: "*"
            # 半个月内都允许
            max-age: 1296000
            # 测试环境，全部允许
            allowedOriginPatterns: "*"
              # allowedOrigins:
              # - "http://localhost:9527"
              # - "http://localhost:9527"
              # - "http://localhost:9528"
              # - "http://localhost:9529"
            # - "http://:9527"
            allowedMethods:
              - GET
              - POST
              - PUT
              - OPTIONS
              - DELETE
      discovery:
        locator:
          # 开启服务注册和发现
          enabled: true
          # 不手动写路由的话，swagger整合不了...
      routes:
        # common system
        - id: system-service-system
          uri: lb://system-service
          predicates:
            - Path=/common/common/**
        # manager goods
        - id: goods-service-manager
          uri: lb://goods-service
          predicates:
            - Path=/manager/goods/**,/manager/other/elasticsearch/**
        # buyer system
        - id: system-service-buyer
          uri: lb://system-service
          predicates:
            - Path=/system/passport/**,/buyer/goods/goods/hot-words/**,/buyer/other/**,/buyer/message/**
        # store system
        - id: system-service-store
          uri: lb://system-service
          predicates:
            - Path=/store/setting/**,/store/message/**,/store/other/**,/store/settings/pageData/**
        # manager system
        - id: system-service-manager
          uri: lb://system-service
          predicates:
            - Path=/manager/other/**,/manager/setting/**,/manager/admin/**,/manager/permission/**,/manager/common/**,/manager/sms/**,/manager/wechat/**,/manager/passport/user/**,/manager/hotwords/**
        # supplier system
        - id: system-service-supplier
          uri: lb://system-service
          predicates:
            - Path=/supplier/other/**,/supplier/setting/**
        # buyer goods
        - id: goods-service-buyer
          uri: lb://goods-service
          predicates:
            - Path=/buyer/goods/**,/buyer/store/store/label/get/**,/buyer/member/collection/GOODS/**,/buyer/member/collection/add/GOODS/**,/buyer/member/collection/delete/GOODS/**,/buyer/member/collection/isCollection/GOODS/**
        # store goods
        - id: goods-service-store
          uri: lb://goods-service
          predicates:
            - Path=/store/goods/**
        # supplier goods
        - id: goods-service-supplier
          uri: lb://goods-service
          predicates:
            - Path=/supplier/goods/draftGoods/**,/supplier/goods/label/**,/supplier/goods/goodsUnit/**,/supplier/goods/spec/**,/supplier/goods/categoryParameters/**
        # buyer member
        - id: member-service-buyer
          uri: lb://member-service
          predicates:
            - Path=/buyer/member/**,/buyer/wallet/**,/buyer/store/**,/buyer/passport/**,/buyer/trade/recharge,/buyer/members/**,/buyer/member/collection/SHOP/**,/buyer/member/collection/add/SHOP/**,/buyer/member/collection/delete/SHOP/**,/buyer/member/collection/isCollection/STORE/**
        # store member
        - id: member-service-store
          uri: lb://member-service
          predicates:
            - Path=/store/member/**,/store/passport/**,/store/order/bill/**,/store/order/get/**,/store/settings/**,/store/role/**,/store/roleMenu/**,/store/menu/**,/store/departmentRole/**,/store/department/**,/store/clerk/**,/store/user/**
        # manager member
        - id: member-service-manager
          uri: lb://member-service
          predicates:
            - Path=/manager/member/**,/manager/message/**,/manager/wallet/**,/manager/store/**,/manager/passport/member/**,/manager/order/bill/**
        # buyer order
        - id: order-service-buyer
          uri: lb://order-service
          predicates:
            - Path=/buyer/order/**,/buyer/trade/**
        # store order
        - id: order-service-store
          uri: lb://order-service
          predicates:
            - Path=/store/order/**,/store/trade/**
        # manager order
        - id: order-service-manager
          uri: lb://order-service
          predicates:
            - Path=/manager/order/**,/manager/trade/**
        # distribution
        - id: distribution-service-distribution
          uri: lb://distribution-service
          predicates:
            - Path=/buyer/distribution/**,/manager/distribution/**,/store/distribution/**
        # payment
        - id: payment-service-payment
          uri: lb://payment-service
          predicates:
            - Path=/buyer/payment/**
        # statistics
        - id: statistics-service-statistics
          uri: lb://statistics-service
          predicates:
            - Path=/store/statistics/**,/manager/statistics/**
        # promotion
        - id: promotion-service-promotion
          uri: lb://promotion-service
          predicates:
            - Path=/manager/promotion/**,/store/promotion/**,/buyer/promotion/**
        # broadcast
        - id: broadcast-service-broadcast
          uri: lb://broadcast-service
          predicates:
            - Path=/store/broadcast/**,/manager/broadcast/**,/buyer/broadcast/**
        # im
        - id: im-service
          uri: lb://im-service
          predicates:
            - Path=/im/**
# 忽略鉴权
ignored:
  urls:
    - /test/**
    - /editor-app/**
    - /actuator**
    - /actuator/**
    - /MP_verify_qSyvBPhDsPdxvOhC.txt
    - /weixin/**
    - /source/**
    - /store/passport/login/**
    - /common/common/slider/**
    - /common/common/sms/**
    - /common/common/site
    - /common/common/IM
    - /buyer/payment/cashier/**
    - /supplier/**
    - /buyer/payment/cashierRefund/**
    - /buyer/other/pageData/**
    - /buyer/other/article/**
    - /buyer/goods/**
    - /buyer/store/**
    - /buyer/passport/connect/**
    - /buyer/members/**
    - /buyer/passport/member/**
    - /buyer/promotion/pintuan/**
    - /buyer/promotion/seckill/**
    - /buyer/promotion/pointsGoods/**
    - /buyer/promotion/coupon
    - /buyer/member/evaluation/**/goodsEvaluation
    - /buyer/member/evaluation/**/evaluationNumber
    - /buyer/other/appVersion/**
    - /buyer/broadcast/studio/**
    - /manager/passport/user/login
    - /manager/passport/user/refresh/**
    - /manager/other/customWords
    - /druid/**
    - /swagger-ui.html
    - /doc.html
    - /swagger-resources/**
    - /swagger/**
    - /webjars/**
    - /v2/api-docs**
    - /v3/api-docs**
    - /configuration/ui
    - /boot-admin
    - /manager/promotion/seckill/init
    - /**/*.js
    - /**/*.css
    - /**/*.png
    - /**/*.ico',
    'f38477b74016dab11b110c78d06cb156',
    '2022-05-09 03:28:38',
    '2022-10-12 09:02:02',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    39,
    'system-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: system-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true
',
    'f74e7afd13f9ad2872e7f6c48b0eede6',
    '2022-07-10 22:18:39',
    '2022-10-12 09:08:12',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    40,
    'goods-service.yml',
    'DEFAULT_GROUP',
    'seata:
  application-id: goods-service
  tx-service-group: goods-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_goods?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai&useInformationSchema=false
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    'db32998eb03c3484b6ee88386fa370f4',
    '2022-07-10 22:18:39',
    '2022-10-12 09:08:36',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    41,
    'member-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: member-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_member?useUnicode=true&rewriteBatchedStatements=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    '9ed8dc08e41b218a8f900ba78020fbce',
    '2022-07-10 22:18:39',
    '2022-10-12 09:09:01',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    42,
    'order-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: order-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_order?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    '04afd2b413559bb35c230a52494e20a3',
    '2022-07-10 22:18:39',
    '2022-10-12 09:09:14',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    43,
    'payment-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: order-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_order?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    '04afd2b413559bb35c230a52494e20a3',
    '2022-07-10 22:18:39',
    '2022-10-12 09:09:49',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    44,
    'promotion-service.yml',
    'DEFAULT_GROUP',
    'seata:
  application-id: promotion-service
  tx-service-group: promotion-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_promotion?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    'd3f4c06e7cb1f0be3136ee349a8a5f21',
    '2022-07-10 22:18:39',
    '2022-10-12 09:10:06',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    45,
    'statistics-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: statistics-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_statistics?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    '003cb2c8e52800c3aea704add258a448',
    '2022-07-10 22:18:39',
    '2022-10-12 09:10:20',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    46,
    'broadcast-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: broardcast-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_broadcast?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    'e4b945bbba27c02feb4224d77bd8b556',
    '2022-07-10 22:18:39',
    '2022-10-12 09:10:41',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    47,
    'distribution-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: distribution-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_distribution?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    'f6a3bd2c4a502352570c7b6e2cce4c18',
    '2022-07-10 22:18:39',
    '2022-10-12 09:11:00',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    48,
    'consumer.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: system-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    'bc9f678a813837c051b581125a1049e0',
    '2022-07-10 22:18:39',
    '2022-10-12 09:11:23',
    'nacos',
    '192.168.65.3',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    81,
    'seataServer.properties',
    'SEATA_GROUP',
    '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html
#Transport configuration, for client and server
transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
service.vgroupMapping.system-service-group=default
service.vgroupMapping.goods-service-group=default
service.vgroupMapping.order-service-group=default
service.vgroupMapping.member-service-group=default
service.vgroupMapping.distribution-service-group=default
service.vgroupMapping.promotion-service-group=default
service.vgroupMapping.statistics-service-group=default
service.vgroupMapping.consumer-service-group=default
service.vgroupMapping.broadcast-service-group=default
service.vgroupMapping.payment-service-group=default
service.vgroupMapping.im-service-group=default

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, DB, and redis configuration values are optional.
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=

#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.
store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://mysql.lilishop-middleware:3306/seata?useUnicode=true&rewriteBatchedStatements=true
store.db.user=root
store.db.password=lilishop
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000

#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898',
    '8b0a7ff30c15697ae813e7f6ff3831c4',
    '2022-07-11 05:41:26',
    '2023-02-27 10:23:49',
    'nacos',
    '192.168.65.4',
    '',
    '4b304983-50ff-41cc-985a-dca6c98caad1',
    '',
    '',
    '',
    'text',
    '',
    ''
  );

INSERT INTO
  nacos.config_info (
    id,
    data_id,
    group_id,
    content,
    md5,
    gmt_create,
    gmt_modified,
    src_user,
    src_ip,
    app_name,
    tenant_id,
    c_desc,
    c_use,
    effect,
    type,
    c_schema,
    encrypted_data_key
  )
VALUES
  (
    234,
    'im-service.yml',
    'DEFAULT_GROUP',
    'seata:
  tx-service-group: im-service-group
spring:
  shardingsphere:
    datasource:
      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性
      names: default-datasource
      default-datasource:
        type: com.alibaba.druid.pool.DruidDataSource
        driverClassName: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://mysql.lilishop-middleware:3306/lilishop_im?useUnicode=true&rewriteBatchedStatements=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
        username: root
        password: lilishop
        maxActive: 20
        initialSize: 5
        maxWait: 60000
        minIdle: 5
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        usePingMethod: false
        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。
        poolPreparedStatements: false
        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100
        maxOpenPreparedStatements: -1
        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙
        filters: stat,wall,log4j2
        #通过connectProperties属性来打开mergeSql功能；慢SQL记录
        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
        #合并多个DruidDataSource的监控数据
        useGlobalDataSourceStat: true
        loginUsername: druid
        loginPassword: druid
    #    sharding:
    #      default-data-source-name: default-datasource
    #      #需要拆分的表，可以设置多个  在 li_order 级别即可
    #      tables:
    #        #需要进行分表的逻辑表名
    #        li_order:
    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01
    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}
    #          table-strategy:
    #            # 分表策略，根据创建日期
    #            standard:
    #              sharding-column: create_time
    #              #分表策略
    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    #              #范围查询实现
    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm
    props:
      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭
      sql:
        show: true',
    '30862e9ec8556cb5213fa0880e8428e6',
    '2023-02-27 10:22:28',
    '2023-02-27 10:22:53',
    'nacos',
    '192.168.65.4',
    '',
    '',
    '',
    '',
    '',
    'yaml',
    '',
    ''
  );

COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;

CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`, `group_id`, `tenant_id`, `datum_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = '增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;

CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`, `group_id`, `tenant_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = 'config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;

CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`, `group_id`, `tenant_id`, `tag_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = 'config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;

CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`, `tag_name`, `tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = 'config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;

CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;

CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 251 DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = '多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    2,
    238,
    'gateway-dev.yml',
    'DEFAULT_GROUP',
    '',
    'spring:\n  redis:\n    host: 192.168.0.108\n    port: 30379\n    password: lilishop\n    lettuce:\n      pool:\n        # 连接池最大连接数（使用负值表示没有限制） 默认 8\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制） 默认 -1\n        max-wait: 20\n        # 连接池中的最大空闲连接 默认 8\n        max-idle: 10\n        # 连接池中的最小空闲连接 默认 8\n        min-idle: 8\n  cloud:\n    gateway:\n      globalcors:\n        cors-configurations:\n          \'[/**]\':\n            allow-credentials: true\n            allowed-headers: \"*\"\n            # 半个月内都允许\n            max-age: 1296000\n            # 测试环境，全部允许\n            allowedOriginPatterns: \"*\"\n            # allowedOrigins:\n              # - \"http://localhost:9527\"\n              # - \"http://localhost:9527\"\n              # - \"http://localhost:9528\"\n              # - \"http://localhost:9529\"\n              # - \"http://:9527\"\n            allowedMethods:\n              - GET\n              - POST\n              - PUT\n              - OPTIONS\n              - DELETE\n      discovery:\n        locator:\n          # 开启服务注册和发现\n          enabled: true\n          # 不手动写路由的话，swagger整合不了...\n      routes:\n        # common system\n        - id: system-service-system\n          uri: lb://system-service\n          predicates:\n            - Path=/common/common/**\n        # manager goods\n        - id: goods-service-manager\n          uri: lb://goods-service\n          predicates:\n            - Path=/manager/goods/**,/manager/other/elasticsearch/**\n        # buyer system\n        - id: system-service-buyer\n          uri: lb://system-service\n          predicates:\n            - Path=/system/passport/**,/buyer/goods/goods/hot-words/**,/buyer/other/**,/buyer/message/**\n        # store system\n        - id: system-service-store\n          uri: lb://system-service\n          predicates:\n            - Path=/store/setting/**,/store/message/**,/store/other/**\n        # manager system\n        - id: system-service-manager\n          uri: lb://system-service\n          predicates:\n            - Path=/manager/other/**,/manager/setting/**,/manager/admin/**,/manager/permission/**,/manager/common/**,/manager/sms/**,/manager/wechat/**,/manager/passport/user/**,/manager/hotwords/**\n        # buyer goods\n        - id: goods-service-buyer\n          uri: lb://goods-service\n          predicates:\n            - Path=/buyer/goods/**,/buyer/store/store/label/get/**,/buyer/member/collection/GOODS/**,/buyer/member/collection/add/GOODS/**,/buyer/member/collection/delete/GOODS/**,/buyer/member/collection/isCollection/GOODS/**\n        # store goods\n        - id: goods-service-store\n          uri: lb://goods-service\n          predicates:\n            - Path=/store/goods/**\n        # buyer member\n        - id: member-service-buyer\n          uri: lb://member-service\n          predicates:\n            - Path=/buyer/member/**,/buyer/wallet/**,/buyer/store/**,/buyer/passport/**,/buyer/trade/recharge,/buyer/members/**,/buyer/member/collection/SHOP/**,/buyer/member/collection/add/SHOP/**,/buyer/member/collection/delete/SHOP/**,/buyer/member/collection/isCollection/STORE/**\n        # store member\n        - id: member-service-store\n          uri: lb://member-service\n          predicates:\n            - Path=/store/member/**,/store/passport/**,/store/order/bill/**,/store/order/get/**,/store/settings/**\n        # manager member\n        - id: member-service-manager\n          uri: lb://member-service\n          predicates:\n            - Path=/manager/member/**,/manager/message/**,/manager/wallet/**,/manager/store/**,/manager/passport/member/**,/manager/order/bill/**\n        # buyer order\n        - id: order-service-buyer\n          uri: lb://order-service\n          predicates:\n            - Path=/buyer/order/**,/buyer/trade/**\n        # store order\n        - id: order-service-store\n          uri: lb://order-service\n          predicates:\n            - Path=/store/order/**,/store/trade/**\n        # manager order\n        - id: order-service-manager\n          uri: lb://order-service\n          predicates:\n            - Path=/manager/order/**,/manager/trade/**\n        # distribution\n        - id: distribution-service-distribution\n          uri: lb://distribution-service\n          predicates:\n            - Path=/buyer/distribution/**,/manager/distribution/**,/store/distribution/**\n        # payment\n        - id: payment-service-payment\n          uri: lb://payment-service\n          predicates:\n            - Path=/buyer/payment/**\n        # statistics\n        - id: statistics-service-statistics\n          uri: lb://statistics-service\n          predicates:\n            - Path=/store/statistics/**,/manager/statistics/**\n        # promotion\n        - id: promotion-service-promotion\n          uri: lb://promotion-service\n          predicates:\n            - Path=/manager/promotion/**,/store/promotion/**,/buyer/promotion/**\n        # broadcast\n        - id: broadcast-service-broadcast\n          uri: lb://broadcast-service\n          predicates:\n            - Path=/store/broadcast/**,/manager/broadcast/**,/buyer/broadcast/**\n# 忽略鉴权\nignored:\n  urls:\n    - /editor-app/**\n    - /actuator**\n    - /actuator/**\n    - /MP_verify_qSyvBPhDsPdxvOhC.txt\n    - /weixin/**\n    - /source/**\n    - /store/passport/login/**\n    - /common/common/slider/**\n    - /common/common/sms/**\n    - /common/common/site\n    - /buyer/payment/cashier/**\n    - /buyer/payment/cashierRefund/**\n    - /buyer/other/pageData/**\n    - /buyer/other/article/**\n    - /buyer/goods/**\n    - /buyer/store/**\n    - /buyer/passport/connect/**\n    - /buyer/members/**\n    - /buyer/passport/member/**\n    - /buyer/promotion/pintuan/**\n    - /buyer/promotion/seckill/**\n    - /buyer/promotion/pointsGoods/**\n    - /buyer/promotion/coupon\n    - /buyer/member/evaluation/**/goodsEvaluation\n    - /buyer/member/evaluation/**/evaluationNumber\n    - /buyer/other/appVersion/**\n    - /buyer/broadcast/studio/**\n    - /manager/passport/user/login\n    - /manager/passport/user/refresh/**\n    - /manager/other/customWords\n    - /druid/**\n    - /swagger-ui.html\n    - /doc.html\n    - /swagger-resources/**\n    - /swagger/**\n    - /webjars/**\n    - /v2/api-docs**\n    - /v3/api-docs**\n    - /configuration/ui\n    - /boot-admin\n    - /manager/promotion/seckill/init\n    - /**/*.js\n    - /**/*.css\n    - /**/*.png\n    - /**/*.ico',
    'f6f6b0f62c8935397adf6b38a5c83b9c',
    '2022-10-12 17:02:02',
    '2022-10-12 09:02:02',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    1,
    239,
    'application-dev.yml',
    'DEFAULT_GROUP',
    '',
    'management:\n  health:\n    db:\n      enabled: false\nserver:\n  servlet:\n    context-path: /\n\n  tomcat:\n    uri-encoding: UTF-8\n    threads:\n      min-spare: 50\n      max: 1000\n# 数据源\nspring:\n  boot:\n    admin:\n      client:\n        url: http://127.0.0.1:8000\n  main: \n    allow-bean-definition-overriding: true\n    # allow-circular-references: true\n  cloud:\n    #sentinel配置\n    sentinel:\n      transport:\n        port: 8719\n        dashboard: 192.168.0.108:30280\n    #避免nacos取网卡出错\n    inetutils:\n      preferred-networks: 192.168.1\n    nacos:\n      discovery:\n        failure-tolerance-enabled: true\n  cache:\n    type: redis\n  mvc:\n    pathmatch:\n      matching-strategy: ANT_PATH_MATCHER\n  # Redis\n  redis:\n    host: 192.168.0.108\n    port: 30379\n    password: lilishop\n    lettuce:\n      pool:\n        # 连接池最大连接数（使用负值表示没有限制） 默认 8\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制） 默认 -1\n        max-wait: 20\n        # 连接池中的最大空闲连接 默认 8\n        max-idle: 10\n        # 连接池中的最小空闲连接 默认 8\n        min-idle: 8\n  # 文件大小上传配置\n  servlet:\n    multipart:\n      max-file-size: 20MB\n      max-request-size: 20MB\n  jackson:\n    time-zone: GMT+8\n    serialization:\n      #关闭jackson 对json做解析\n      fail-on-empty-beans: false\n\n# Swagger界面内容配置\nswagger:\n  title: lilishop API接口文档\n  description: lilishop Api Documentation\n  version: 4.2.4\n  termsOfServiceUrl: https://pickmall.cn\n  contact:\n    name: lili\n    url: https://pickmall.cn\n    email: admin@pickmall.com\n\n# Mybatis-plus\nmybatis-plus:\n  mapper-locations: classpath*:mapper/*.xml\n  configuration:\n    #缓存开启\n    cache-enabled: true\n    #日志\n#    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# 日志\nlogging:\n  # 输出级别\n  level:\n    # root: debug\n    cn.lili: debug\n    # io.seata: debug\n  #    org.hibernate: debug\n  #    org.springframework: debug\n  #    org.springframework.data.mongodb.core: debug\n  file:\n    # 指定路径\n    path: logs\n  logback:\n    rollingpolicy:\n      # 最大保存天数\n      max-history: 7\n      # 每个文件最大大小\n      max-file-size: 5MB\n#加密参数\njasypt:\n  encryptor:\n    password: lili\n\n\nlili:\n  #验证码设置\n  verification-code:\n    #图形验证码有效时间 秒 包含滑块验证码有效时间， 以及验证通过之后，缓存中存储的验证结果有效时间\n    effectiveTime: 300\n    #水印\n    watermark: LILI-SHOP\n    #干扰项数量 最大2 默认0\n    interfereNum: 1\n    #允许误差像素\n    faultTolerant: 3\n  #短信模版配置\n  sms:\n    #登录\n    LOGIN: SMS_205755300\n    #注册\n    REGISTER: SMS_205755298\n    #找回密码\n    FIND_USER: SMS_205755301\n    #设置密码\n    UPDATE_PASSWORD: SMS_205755297\n    #支付密码\n    WALLET_PASSWORD: SMS_205755301\n  system:\n    isDemoSite: false\n    isTestModel: true\n  #     脱敏级别：\n  #     0：不做脱敏处理\n  #     1：管理端用户手机号等信息脱敏\n  #     2：商家端信息脱敏（为2时，表示管理端，商家端同时脱敏）\n  #    sensitiveLevel: 2\n\n  statistics:\n    # 在线人数统计 X 小时。这里设置48，即统计过去48小时每小时在线人数\n    onlineMember: 48\n    # 当前在线人数刷新时间间隔，单位秒，设置为600，则每10分钟刷新一次\n    currentOnlineUpdate: 600\n  #qq lbs 申请\n  lbs:\n    key: 4BYBZ-7MT6S-PUAOA-6BNWL-FJUD7-UUFXT\n    sk: zhNKVrJK6UPOhqIjn8AQvG37b9sz6\n  #域名\n  domain:\n    pc: http://192.168.0.116:8888\n    wap: http://192.168.0.116:8888\n    seller: http://192.168.0.116:8888\n    admin: http://192.168.0.116:8888\n  #api地址\n  api:\n    buyer: https://z171l91606.51mypc.cn\n    base: http://192.168.0.116:8888\n    manager: http://192.168.0.116:8888\n    seller: http://192.168.0.116:8888\n\n  # jwt 细节设定\n  jwt-setting:\n    # token过期时间（分钟）\n    tokenExpireTime: 30000\n\n  # 使用Spring @Cacheable注解失效时间\n  cache:\n    # 过期时间 单位秒 永久不过期设为-1\n    timeout: 1500\n  #多线程配置\n  thread:\n    corePoolSize: 5\n    maxPoolSize: 50\n    queueCapacity: 50\n  data:\n    elasticsearch:\n      cluster-name: elasticsearch\n      cluster-nodes: 192.168.0.108:30920\n      index:\n        number-of-replicas: 0\n        number-of-shards: 3\n      index-prefix: lili\n      schema: http\n    #      account:\n    #        username: elastic\n    #        password: LiLiShopES\n\n    logstash:\n      server: 192.168.0.108:30560\n    rocketmq:\n      promotion-topic: lili_promotion_topic\n      promotion-group: lili_promotion_group\n      msg-ext-topic: lili_msg_topic\n      msg-ext-group: lili_msg_group\n      goods-topic: lili_goods_topic\n      goods-group: lili_goods_group\n      order-topic: lili_order_topic\n      order-group: lili_order_group\n      member-topic: lili_member_topic\n      member-group: lili_member_group\n      other-topic: lili_other_topic\n      other-group: lili_other_group\n      notice-topic: lili_notice_topic\n      notice-group: lili_notice_group\n      notice-send-topic: lili_send_notice_topic\n      notice-send-group: lili_send_notice_group\n      after-sale-topic: lili_after_sale_topic\n      after-sale-group: lili_after_sale_group\nrocketmq:\n  name-server: 192.168.0.108:30876\n  isVIPChannel: false\n  producer:\n    group: lili_group\n    send-message-timeout: 30000\n\nxxl:\n  job:\n    admin:\n      addresses: http://192.168.0.108:30001/xxl-job-admin\n    executor:\n      appname: xxl-job-executor-lilishop\n      address:\n      ip:\n      port: 8891\n      logpath: ./xxl-job/executor\n      logretentiondays: 7\nfeign:\n  client:\n    config:\n      default:\n        connectTimeout: 500000\n        readTimeout: 500000\n        loggerLevel: basic\n  inside:\n    key: mall4cloud-feign-inside-key\n    secret: mall4cloud-feign-inside-secret\n    # ip白名单，如果有需要的话，用小写逗号分割\n    ips: \n  circuitbreaker:\n    enabled: true\n  sentinel:\n    default-rule: default # 全局规则名称\n    rules:\n         # 全局配置，这些参数的意思请查看 com.alibaba.csp.sentinel.slots.block.degrade.DegradeRule\n         # 可配置多条规则\n        default:\n          - grade: 2\n            count: 1\n            timeWindow: 1\n            statIntervalMs: 1000\n            minRequestAmount: 5\n          - grade: 2\n            count: 1\n         # 针对 user FeignClient\n        user:\n          - grade: 2\n            count: 1\n            timeWindow: 1\n            statIntervalMs: 1000\n            minRequestAmount: 5\nseata:\n  # application-id: ${spring.application.name}\n  enabled: false\n  # 启用自动数据源代理\n  enable-auto-data-source-proxy: false\n  # use-jdk-proxy: false\n  # Seata 的注册方式为 nacos\n  registry:\n    type: nacos\n    nacos:\n      server-addr: 192.168.0.108:30848\n      group: SEATA_GROUP\n      namespace: 4b304983-50ff-41cc-985a-dca6c98caad1\n      username: nacos\n      password: nacos\n  # Seata 的配置中心为 nacos\n  config:\n    type: nacos\n    nacos:\n      serverAddr: 192.168.0.108:30848\n      group: SEATA_GROUP\n      dataId: seataServer.properties\n      namespace: 4b304983-50ff-41cc-985a-dca6c98caad1\n      username: nacos\n      password: nacos',
    '646a1be86626dc4368910ebdf592cd47',
    '2022-10-12 17:06:43',
    '2022-10-12 09:06:44',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    81,
    240,
    'seataServer.properties',
    'SEATA_GROUP',
    '',
    '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\nservice.vgroupMapping.system-service-group=default\nservice.vgroupMapping.goods-service-group=default\nservice.vgroupMapping.order-service-group=default\nservice.vgroupMapping.member-service-group=default\nservice.vgroupMapping.distribution-service-group=default\nservice.vgroupMapping.promotion-service-group=default\nservice.vgroupMapping.statistics-service-group=default\nservice.vgroupMapping.consumer-service-group=default\nservice.vgroupMapping.broadcast-service-group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=true\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#Transaction storage configuration, only for the server. The file, DB, and redis configuration values are optional.\nstore.mode=db\nstore.lock.mode=db\nstore.session.mode=db\n#Used for password encryption\nstore.publicKey=\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.db.datasource=druid\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\nstore.db.url=jdbc:mysql://192.168.0.108:30306/seata?useUnicode=true&rewriteBatchedStatements=true\nstore.db.user=root\nstore.db.password=lilishop\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.xaerNotaRetryTimeout=60000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=false\nserver.enableParallelRequestHandle=false\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
    '967708824d99066804ab5be016aa4982',
    '2022-10-12 17:07:23',
    '2022-10-12 09:07:23',
    'nacos',
    '192.168.65.3',
    'U',
    '4b304983-50ff-41cc-985a-dca6c98caad1',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    39,
    241,
    'system-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: system-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true\n',
    '2408310c347cf19a662829a8424660e6',
    '2022-10-12 17:08:12',
    '2022-10-12 09:08:12',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    40,
    242,
    'goods-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  application-id: goods-service\n  tx-service-group: goods-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_goods?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai&useInformationSchema=false\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '9f9dac0db842d28f5b6586787e389189',
    '2022-10-12 17:08:35',
    '2022-10-12 09:08:36',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    41,
    243,
    'member-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: member-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_member?useUnicode=true&rewriteBatchedStatements=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    'ace57b0f22c75b3911b37e0535146f12',
    '2022-10-12 17:09:01',
    '2022-10-12 09:09:01',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    42,
    244,
    'order-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: order-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_order?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '47a30d86044f74adaf6c737f55c5a185',
    '2022-10-12 17:09:14',
    '2022-10-12 09:09:14',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    43,
    245,
    'payment-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: order-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_order?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '47a30d86044f74adaf6c737f55c5a185',
    '2022-10-12 17:09:48',
    '2022-10-12 09:09:49',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    44,
    246,
    'promotion-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  application-id: promotion-service\n  tx-service-group: promotion-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_promotion?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '23f3667618ff02e6350c45201a1e1077',
    '2022-10-12 17:10:06',
    '2022-10-12 09:10:06',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    45,
    247,
    'statistics-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: statistics-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_statistics?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '9d3bec11f86178ff55b868edb0ed72bd',
    '2022-10-12 17:10:20',
    '2022-10-12 09:10:20',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    46,
    248,
    'broadcast-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: broardcast-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_broadcast?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '98564f80beb334f11b0574bf254e232f',
    '2022-10-12 17:10:41',
    '2022-10-12 09:10:41',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    47,
    249,
    'distribution-service.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: distribution-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_distribution?useUnicode=true&characterEncoding=utf-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    '72498774024be411fd66d2f8965d5694',
    '2022-10-12 17:10:59',
    '2022-10-12 09:11:00',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

INSERT INTO
  `his_config_info` (
    `id`,
    `nid`,
    `data_id`,
    `group_id`,
    `app_name`,
    `content`,
    `md5`,
    `gmt_create`,
    `gmt_modified`,
    `src_user`,
    `src_ip`,
    `op_type`,
    `tenant_id`,
    `encrypted_data_key`
  )
VALUES
  (
    48,
    250,
    'consumer.yml',
    'DEFAULT_GROUP',
    '',
    'seata:\n  tx-service-group: system-service-group\nspring:\n  shardingsphere:\n    datasource:\n      #  数据库名称，可自定义，可以为多个，以逗号隔开，每个在这里定义的库，都要在下面定义连接属性\n      names: default-datasource\n      default-datasource:\n        type: com.alibaba.druid.pool.DruidDataSource\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.0.108:30306/lilishop_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n        username: root\n        password: lilishop\n        maxActive: 20\n        initialSize: 5\n        maxWait: 60000\n        minIdle: 5\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        usePingMethod: false\n        #是否缓存preparedStatement，也就是PSCache。在mysql下建议关闭。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。\n        poolPreparedStatements: false\n        #要启用PSCache，-1为关闭 必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true  可以把这个数值配置大一些，比如说100\n        maxOpenPreparedStatements: -1\n        #配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,log4j2\n        #通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        #合并多个DruidDataSource的监控数据\n        useGlobalDataSourceStat: true\n        loginUsername: druid\n        loginPassword: druid\n    #    sharding:\n    #      default-data-source-name: default-datasource\n    #      #需要拆分的表，可以设置多个  在 li_order 级别即可\n    #      tables:\n    #        #需要进行分表的逻辑表名\n    #        li_order:\n    #          #实际的表结点,下面代表的是li_order_为开头的所有表，如果能确定表的范围例如按月份分表，这里的写法是data2020.li_order_$->{2020..2021}_$->{01..12}  表示例如 li_order_2020_01 li_order_2020_03 li_order_2021_01\n    #          actual-data-nodes: data2020.li_order_$->{2019..2021}_$->{01..12}\n    #          table-strategy:\n    #            # 分表策略，根据创建日期\n    #            standard:\n    #              sharding-column: create_time\n    #              #分表策略\n    #              precise-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    #              #范围查询实现\n    #              range-algorithm-class-name: cn.lili.mybatis.sharding.CreateTimeShardingTableAlgorithm\n    props:\n      #是否打印逻辑SQL语句和实际SQL语句，建议调试时打印，在生产环境关闭\n      sql:\n        show: true',
    'eb375427e3b603dde96cb5c2d2f9b6c6',
    '2022-10-12 17:11:22',
    '2022-10-12 09:11:23',
    'nacos',
    '192.168.65.3',
    'U',
    '',
    ''
  );

COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`, `role`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;

INSERT INTO
  `roles` (`username`, `role`)
VALUES
  ('nacos', 'ROLE_ADMIN');

COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;

CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = '租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;

CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`, `tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb3 COLLATE = utf8_bin COMMENT = 'tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;

INSERT INTO
  `tenant_info` (
    `id`,
    `kp`,
    `tenant_id`,
    `tenant_name`,
    `tenant_desc`,
    `create_source`,
    `gmt_create`,
    `gmt_modified`
  )
VALUES
  (
    1,
    '1',
    '4b304983-50ff-41cc-985a-dca6c98caad1',
    'seata',
    'seata-namepace',
    'nacos',
    1657529830554,
    1657529830554
  );

COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;

INSERT INTO
  `users` (`username`, `password`, `enabled`)
VALUES
  (
    'nacos',
    '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',
    1
  );

COMMIT;

SET
  FOREIGN_KEY_CHECKS = 1;