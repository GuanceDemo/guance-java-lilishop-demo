drop database if exists lilishop_member;

create database lilishop_member CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_member;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_connect
-- ----------------------------
DROP TABLE IF EXISTS `li_connect`;

CREATE TABLE `li_connect` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `union_id` varchar(64) DEFAULT NULL COMMENT '联合登录ID',
  `union_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联合登录类型',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `union` (`union_id`, `union_type`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '联合登录表';

-- ----------------------------
-- Records of li_connect
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_foot_print
-- ----------------------------
DROP TABLE IF EXISTS `li_foot_print`;

CREATE TABLE `li_foot_print` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `sku_id` bigint DEFAULT NULL COMMENT '规格ID',
  `store_id` varchar(255) DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id` (`member_id`) COMMENT '会员id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '足迹表';

-- ----------------------------
-- Records of li_foot_print
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member
-- ----------------------------
DROP TABLE IF EXISTS `li_member`;

CREATE TABLE `li_member` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `birthday` datetime(6) DEFAULT NULL COMMENT '会员生日',
  `disabled` bit(1) DEFAULT NULL COMMENT '会员状态',
  `face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员头像',
  `have_store` bit(1) DEFAULT NULL COMMENT '是否开通店铺',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员密码',
  `points` bigint DEFAULT '0' COMMENT '积分数量',
  `sex` int NOT NULL DEFAULT '0' COMMENT '会员性别',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员用户名',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员地址',
  `region_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员地址ID',
  `client_enum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户端',
  `last_login_date` datetime(6) DEFAULT NULL COMMENT '最后一次登录时间',
  `gradeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `experience` bigint DEFAULT NULL,
  `grade_id` bigint DEFAULT NULL,
  `total_point` bigint DEFAULT '0' COMMENT '积分总数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) COMMENT 'username唯一索引',
  KEY `query_mobile` (`mobile`) COMMENT 'query_member',
  KEY `username-query` (`username`) COMMENT 'username查询索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '会员表';

-- ----------------------------
-- Records of li_member
-- ----------------------------
BEGIN;

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1376364798236688384,
    NULL,
    '2021-03-28 21:45:14.178000',
    0,
    '15810610731',
    '2021-09-07 09:40:49.704000',
    '2021-03-28 00:00:00.000000',
    1,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/00218693d2e64c9893b269d1aec77f94.jpeg',
    1,
    '15810610731',
    '星星眨眨眼,月儿画问号',
    '$2a$10$VqGFaEoNj/VvZ/5tz1pp3uEbY5Hdv/vhmA/6v7rTk.9llUELxoCqu',
    1040,
    1,
    1376369067769724928,
    '15810610731',
    '上海市 , 上海城区 , 浦东新区 , 高东镇',
    '1371783040048562731,1371783040048562732,1371783040048562733,1371783040048562734',
    'PC',
    '2021-09-07 09:40:49.643000',
    NULL,
    NULL,
    NULL,
    15129
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1376417684140326912,
    NULL,
    '2021-03-29 01:15:23.159000',
    0,
    '13011111111',
    '2022-07-04 18:19:33.786000',
    '2021-06-30 00:00:00.000000',
    1,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/e71d692092264992949bfbb34ce2dfb3.jpeg',
    1,
    '13011111111',
    'jack',
    '$2a$10$Tb44xSPTCuuWxxZd5ebmfO0pq/J9XSHSqoKdi7ctFoKPHrcBShMLK',
    8283,
    1,
    1376433565247471616,
    '13011111111',
    '北京市,北京城区,延庆区,八达岭镇',
    NULL,
    'PC',
    '2022-07-07 16:34:47.564000',
    NULL,
    NULL,
    NULL,
    7808
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1423603288611246081,
    NULL,
    '2021-08-06 19:14:07.934000',
    0,
    '15810610731',
    '2021-08-10 19:19:08.468000',
    NULL,
    1,
    NULL,
    0,
    '18234124540',
    '18234124540',
    '$2a$10$BKLYoLtQvuIPAODxU.iJF.rij5iTL2ABnqiRCQFWykRpkcxedFzUq',
    20,
    0,
    NULL,
    'coco',
    NULL,
    NULL,
    'PC',
    '2021-08-06 19:14:17.705000',
    NULL,
    NULL,
    NULL,
    6499
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1425404609777733634,
    NULL,
    '2021-08-11 18:31:56.402000',
    0,
    NULL,
    '2021-08-12 00:10:56.698000',
    NULL,
    1,
    NULL,
    0,
    '15810610730',
    '15810610730',
    'ba5ed808ad73ae79d3c739fb1525938c',
    1613,
    0,
    NULL,
    '15810610730',
    NULL,
    NULL,
    'PC',
    '2021-08-12 00:10:56.698000',
    NULL,
    NULL,
    NULL,
    1613
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1425433055413170178,
    NULL,
    '2021-08-11 20:24:58.336000',
    0,
    NULL,
    '2021-08-11 22:11:10.052000',
    NULL,
    1,
    NULL,
    0,
    '13011251421',
    '13011251421',
    '$2a$10$/CsT9YLK2f/l7mFwvAj6LOCl3ddNf3ycsWfFY/F63u7YxSUCArXFq',
    10,
    0,
    NULL,
    'abcc',
    NULL,
    NULL,
    'PC',
    '2021-08-11 22:11:10.052000',
    NULL,
    NULL,
    NULL,
    6499
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1425450071696109569,
    NULL,
    '2021-08-11 21:32:35.331000',
    0,
    NULL,
    '2021-08-11 21:32:42.670000',
    NULL,
    1,
    NULL,
    0,
    '13213413434',
    '13213413434',
    '$2a$10$2KGIsh.C9XHVUqpy0X.Ky.Ga/yQE87tD5x76ZEuX557TBAaf70RiK',
    10,
    0,
    NULL,
    'acc',
    NULL,
    NULL,
    'PC',
    '2021-08-11 21:32:42.668000',
    NULL,
    NULL,
    NULL,
    6499
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1428650673307365377,
    NULL,
    '2021-08-20 17:30:38.220000',
    0,
    NULL,
    '2021-09-01 17:30:27.670000',
    NULL,
    1,
    NULL,
    0,
    '18510335217',
    '18510335217',
    '19b271de232f14b94532954f48e1266e',
    10,
    0,
    NULL,
    '18510335217',
    NULL,
    NULL,
    'H5',
    '2021-09-01 17:30:27.669000',
    NULL,
    NULL,
    NULL,
    6499
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1430821123915436033,
    'SYSTEM',
    '2021-08-26 17:15:13.969000',
    0,
    NULL,
    '2021-08-27 16:28:11.040000',
    NULL,
    1,
    NULL,
    0,
    '13011111112',
    '13011111112',
    '335d5ad976b85582b8e5c0ca01f2ba56',
    10,
    0,
    NULL,
    '13011111112',
    NULL,
    NULL,
    'H5',
    '2021-08-27 16:28:11.039000',
    NULL,
    NULL,
    NULL,
    6499
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1433001283647721473,
    'SYSTEM',
    '2021-09-01 17:38:24.555000',
    0,
    NULL,
    '2021-09-01 17:38:24.906000',
    NULL,
    1,
    NULL,
    0,
    '18510610731',
    '18510610731',
    '0be428a96ae7c1513eb5e68978db25fa',
    10,
    0,
    NULL,
    '18510610731',
    NULL,
    NULL,
    'H5',
    '2021-09-01 17:38:24.643000',
    NULL,
    NULL,
    NULL,
    6499
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1433234460152811522,
    'SYSTEM',
    '2021-09-02 09:04:58.168000',
    0,
    'ピカチュウ',
    '2022-06-15 15:29:47.695000',
    '1970-01-01 00:00:00.000000',
    1,
    'null',
    0,
    '15810335217',
    '158****5217',
    '44b9d772e29d12e3bd391e8e6edcab6e',
    10,
    0,
    NULL,
    '158****5217',
    'undefined',
    'undefined',
    'H5',
    '2021-09-02 09:04:58.262000',
    NULL,
    NULL,
    NULL,
    10
  );

INSERT INTO
  `li_member` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `birthday`,
    `disabled`,
    `face`,
    `have_store`,
    `mobile`,
    `nick_name`,
    `password`,
    `points`,
    `sex`,
    `store_id`,
    `username`,
    `region`,
    `region_id`,
    `client_enum`,
    `last_login_date`,
    `gradeId`,
    `experience`,
    `grade_id`,
    `total_point`
  )
VALUES
  (
    1441228632902103042,
    'SYSTEM',
    '2021-09-24 10:30:57.489000',
    0,
    'ピカチュウ',
    '2022-06-15 15:19:43.075000',
    '2022-06-15 00:00:00.000000',
    0,
    'http://qding-dev2.oss-cn-beijing.aliyuncs.com/GuanjiaApp/1418831372265803776/7291628677332.png',
    0,
    '13810229876',
    '123151',
    '111111',
    0,
    0,
    NULL,
    'm138****9876',
    'undefined',
    'undefined',
    'PC',
    '2021-09-24 10:31:49.117000',
    NULL,
    NULL,
    NULL,
    0
  );

COMMIT;

-- ----------------------------
-- Table structure for li_member_address
-- ----------------------------
DROP TABLE IF EXISTS `li_member_address`;

CREATE TABLE `li_member_address` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址别名',
  `consignee_address_id_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址ID',
  `consignee_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址名称',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否为默认收货地址',
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '纬度',
  `lon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '经度',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员收货地址表';

-- ----------------------------
-- Records of li_member_address
-- ----------------------------
BEGIN;

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1423141512023142401,
    '13011111111',
    '2021-08-05 12:39:11.000000',
    0,
    '13011111111',
    '2021-08-11 23:59:21.100000',
    '1213',
    '1401797451790156093,1401797451790156094,1401797451790156235,1401797451790156239',
    '北京市,北京城区,东城区,东华门街道',
    '正义路12号中华人民共和国公安部',
    0,
    '39.904989',
    '116.405285',
    1376417684140326912,
    '13232321232',
    '1312321'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1423208806397054978,
    '15810610731',
    '2021-08-05 17:06:36.000000',
    0,
    '15810610731',
    '2021-08-11 22:42:40.397000',
    '123',
    '1401797451580440758,1401797451580440759,1401797451580440929,1401797451580440938',
    '上海市,上海城区,静安区,天目西路街道',
    '秣陵路303号上海站',
    1,
    '31.249574',
    '121.455708',
    1376364798236688384,
    '13233333333',
    'xiaozheng'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1425411199280975873,
    '15810610730',
    '2021-08-11 18:58:07.426000',
    0,
    NULL,
    NULL,
    NULL,
    '1401797451706269749,1401797451706270007,1401797451706270104,1401797451706270108',
    '河北省,廊坊市,广阳区,银河北路街道',
    '永丰道锦江都城酒店(廊坊万达广场店)',
    0,
    '39.523927',
    '116.704441',
    1425404609777733634,
    '13333333333',
    '张三'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1425486196020195330,
    '13011111111',
    '2021-08-11 23:56:08.000000',
    0,
    '13011111111',
    '2021-08-11 23:56:40.851000',
    'ass',
    '1401797451706269749,1401797451706270007,1401797451706270104,1401797451706270108',
    '河北省,廊坊市,广阳区,银河北路街道',
    '永丰道锦江都城酒店(廊坊万达广场店)',
    1,
    '39.523927',
    '116.704441',
    1376417684140326912,
    '13012251251',
    '123124'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1428650998147821570,
    '18510335217',
    '2021-08-20 17:31:55.668000',
    0,
    NULL,
    NULL,
    '132131',
    '1401797451530109606,1401797451534303280,1401797451534303293,1401797451534303295',
    '新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市,阿拉套街道',
    '1231231231131231312',
    0,
    '82.5929',
    '45.1378',
    1428650673307365377,
    '13232323232',
    '131231'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1433001399527952386,
    '18510610731',
    '2021-09-01 17:38:52.000000',
    0,
    '18510610731',
    '2021-09-01 18:06:18.721000',
    NULL,
    '1401797451790156093,1401797451790156094,1401797451790156235,1401797451790156239',
    '北京市,北京城区,东城区,东华门街道',
    '北京市东城区东华门街道天安门',
    1,
    '39.908821',
    '116.397469',
    1433001283647721473,
    '13123231313',
    '13123'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1433238459656495106,
    '15810335217',
    '2021-09-02 09:20:51.000000',
    0,
    '15810335217',
    '2021-09-02 09:56:24.583000',
    NULL,
    '1401797451790156093,1401797451790156094,1401797451790156235,1401797451790156239',
    '北京市,北京城区,东城区,东华门街道',
    '北京市东城区东华门街道天安门',
    0,
    '39.908821',
    '116.397469',
    1433234460152811522,
    '13213131313',
    '13123'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1433247398139469825,
    '15810335217',
    '2021-09-02 09:56:22.000000',
    0,
    NULL,
    '2021-09-02 11:15:15.354000',
    NULL,
    '1401797451790156093,1401797451790156094,1401797451790156235,1401797451790156239',
    '北京市,北京城区,东城区,东华门街道',
    '北京市东城区东华门街道天安门',
    1,
    '39.908821',
    '116.397469',
    1433234460152811522,
    '13213123131',
    '131312'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1433247448227848193,
    '15810335217',
    '2021-09-02 09:56:34.000000',
    0,
    '15810335217',
    '2021-09-02 09:56:36.190000',
    NULL,
    '1401797451790156093,1401797451790156094,1401797451790156235,1401797451790156239',
    '北京市,北京城区,东城区,东华门街道',
    '北京市东城区东华门街道天安门',
    0,
    '39.908737',
    '116.397514',
    1433234460152811522,
    '13131231231',
    '1231'
  );

INSERT INTO
  `li_member_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `alias`,
    `consignee_address_id_path`,
    `consignee_address_path`,
    `detail`,
    `is_default`,
    `lat`,
    `lon`,
    `member_id`,
    `mobile`,
    `name`
  )
VALUES
  (
    1534736275536367618,
    '13011111111',
    '2022-06-09 11:16:56.769000',
    0,
    NULL,
    NULL,
    '2121',
    '1534722815645945856,1534722815650140264,1534722815650140265,1534722815650140269',
    '河南省,三门峡市,卢氏县,潘河乡',
    '122222',
    0,
    '34.085143',
    '110.835767',
    1376417684140326912,
    '13011111111',
    '21'
  );

COMMIT;

-- ----------------------------
-- Table structure for li_member_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `li_member_evaluation`;

CREATE TABLE `li_member_evaluation` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评价内容',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '好中差评',
  `have_image` bit(1) DEFAULT NULL COMMENT '评价是否有图片',
  `have_reply_image` bit(1) DEFAULT NULL COMMENT '回复是否有图片',
  `images` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '评价图片',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `member_profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员头像',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单号',
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评价回复',
  `reply_image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '评价回复图片',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `sku_id` bigint DEFAULT NULL COMMENT '货品ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `reply_status` bit(1) DEFAULT NULL COMMENT '回复状态',
  `delivery_score` int DEFAULT NULL COMMENT '物流评分',
  `description_score` int DEFAULT NULL COMMENT '描述评分',
  `service_score` int DEFAULT NULL COMMENT '服务评分',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员评价表';

-- ----------------------------
-- Records of li_member_evaluation
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_grade
-- ----------------------------
DROP TABLE IF EXISTS `li_member_grade`;

CREATE TABLE `li_member_grade` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `experience_value` int NOT NULL COMMENT '经验值',
  `grade_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '等级图片',
  `grade_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '等级名称',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否默认等级',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员等级表';

-- ----------------------------
-- Records of li_member_grade
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_notice
-- ----------------------------
DROP TABLE IF EXISTS `li_member_notice`;

CREATE TABLE `li_member_notice` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '站内信内容',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否已读',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `receive_time` bigint DEFAULT NULL COMMENT '阅读时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员站内信表';

-- ----------------------------
-- Records of li_member_notice
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_notice_log
-- ----------------------------
DROP TABLE IF EXISTS `li_member_notice_log`;

CREATE TABLE `li_member_notice_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `admin_id` bigint DEFAULT NULL COMMENT '管理员ID',
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理员名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容',
  `member_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员ID',
  `send_time` datetime(6) DEFAULT NULL COMMENT '发送时间',
  `send_type` int DEFAULT NULL COMMENT '发送类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员站内信发送记录表';

-- ----------------------------
-- Records of li_member_notice_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_notice_senter
-- ----------------------------
DROP TABLE IF EXISTS `li_member_notice_senter`;

CREATE TABLE `li_member_notice_senter` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容',
  `member_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员ID',
  `send_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发送类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员站内信发送表';

-- ----------------------------
-- Records of li_member_notice_senter
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_points_history
-- ----------------------------
DROP TABLE IF EXISTS `li_member_points_history`;

CREATE TABLE `li_member_points_history` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `before_point` bigint DEFAULT NULL COMMENT '消费之前积分',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `points` bigint DEFAULT NULL COMMENT '当前积分',
  `point_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消费积分类型',
  `variable_point` bigint DEFAULT NULL COMMENT '消费积分',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id` (`member_id`) COMMENT '积分记录查询索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员积分记录表';

-- ----------------------------
-- Records of li_member_points_history
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_receipt
-- ----------------------------
DROP TABLE IF EXISTS `li_member_receipt`;

CREATE TABLE `li_member_receipt` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `is_default` int DEFAULT NULL COMMENT '是否为默认选项',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `receipt_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票内容',
  `receipt_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票抬头',
  `receipt_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票类型',
  `taxpayer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '纳税人识别号',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员收货地址表';

-- ----------------------------
-- Records of li_member_receipt
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_sign
-- ----------------------------
DROP TABLE IF EXISTS `li_member_sign`;

CREATE TABLE `li_member_sign` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员用户ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员用户名',
  `sign_day` int DEFAULT NULL COMMENT '连续签到天数',
  `day` int DEFAULT NULL COMMENT '签到日 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_member_day` (`member_id`, `day`) COMMENT 'uk_member_day',
  KEY `query_create_time` (`create_time`) COMMENT 'query_create_time',
  KEY `query_member_id` (`member_id`) COMMENT 'query_member_id'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员签到表';

-- ----------------------------
-- Records of li_member_sign
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_wallet
-- ----------------------------
DROP TABLE IF EXISTS `li_member_wallet`;

CREATE TABLE `li_member_wallet` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `member_frozen_wallet` double DEFAULT NULL COMMENT '会员预存款冻结金额',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员用户名',
  `member_wallet` double DEFAULT NULL COMMENT '会员预存款',
  `wallet_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '预存款密码',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员预存款表';

-- ----------------------------
-- Records of li_member_wallet
-- ----------------------------
BEGIN;

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1376360615437664256,
    '13011111111',
    '2021-03-28 21:28:36.921000',
    0,
    NULL,
    NULL,
    0,
    1376360490497736704,
    '13011111111',
    10000,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1376364816318332928,
    '15810610731',
    '2021-03-28 21:45:18.489000',
    0,
    'admin',
    '2021-09-26 11:26:25.902000',
    0,
    1376364798236688384,
    '15810610731',
    99967862.09,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1423141532076109825,
    '13011111111',
    '2021-08-05 12:39:16.596000',
    0,
    '13011111111',
    '2022-07-12 15:19:09.368000',
    11,
    1376417684140326912,
    '13011111111',
    918275.1,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1423603290569973762,
    NULL,
    '2021-08-06 19:14:08.400000',
    0,
    NULL,
    NULL,
    0,
    1423603288611246081,
    'coco',
    11111111,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1423613819988602881,
    NULL,
    '2021-08-06 19:55:58.817000',
    0,
    NULL,
    NULL,
    0,
    1423603288611246081,
    'coco',
    11111111,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1425404615205097474,
    NULL,
    '2021-08-11 18:31:57.659000',
    0,
    NULL,
    NULL,
    0,
    1425404609777733634,
    '15810610730',
    11111111,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1425433057279688706,
    NULL,
    '2021-08-11 20:24:58.778000',
    0,
    NULL,
    NULL,
    0,
    1425433055413170178,
    'abcc',
    11111111,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1425450071960403969,
    NULL,
    '2021-08-11 21:32:35.395000',
    0,
    NULL,
    NULL,
    0,
    1425450071696109569,
    'acc',
    11111111,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1428650675610038273,
    '18510335217',
    '2021-08-20 17:30:38.769000',
    0,
    '18510335217',
    '2021-09-01 17:33:02.710000',
    0,
    1428650673307365377,
    '18510335217',
    11107879,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1430821124702306305,
    'SYSTEM',
    '2021-08-26 17:15:14.158000',
    0,
    NULL,
    NULL,
    0,
    1430821123915436033,
    '13011111112',
    11111111,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1433001285593878530,
    'SYSTEM',
    '2021-09-01 17:38:25.019000',
    0,
    '18510610731',
    '2021-09-01 17:39:49.210000',
    0,
    1433001283647721473,
    '18510610731',
    11107879,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1433234461914304513,
    'SYSTEM',
    '2021-09-02 09:04:58.586000',
    0,
    '15810335217',
    '2021-09-02 09:43:54.807000',
    0,
    1433234460152811522,
    '15810335217',
    11107876,
    NULL
  );

INSERT INTO
  `li_member_wallet` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_frozen_wallet`,
    `member_id`,
    `member_name`,
    `member_wallet`,
    `wallet_password`
  )
VALUES
  (
    1542419516829478913,
    'admin',
    '2022-06-30 16:07:24.241000',
    0,
    NULL,
    NULL,
    0,
    1441228632902103042,
    'm138****9876',
    0,
    NULL
  );

COMMIT;

-- ----------------------------
-- Table structure for li_member_withdraw_apply
-- ----------------------------
DROP TABLE IF EXISTS `li_member_withdraw_apply`;

CREATE TABLE `li_member_withdraw_apply` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `apply_money` double(20, 2) DEFAULT NULL COMMENT '申请提现金额',
  `apply_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提现状态',
  `inspect_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核备注',
  `inspect_time` datetime(6) DEFAULT NULL COMMENT '审核时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编号',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `connect_number` varchar(255) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员提现申请表';

-- ----------------------------
-- Records of li_member_withdraw_apply
-- ----------------------------
BEGIN;

INSERT INTO
  `li_member_withdraw_apply` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `apply_money`,
    `apply_status`,
    `inspect_remark`,
    `inspect_time`,
    `member_id`,
    `member_name`,
    `sn`
  )
VALUES
  (
    1543868379071307777,
    '13011111111',
    '2022-07-04 16:04:39.917000',
    0,
    NULL,
    NULL,
    11.00,
    'APPLY',
    NULL,
    NULL,
    1376417684140326912,
    'jack',
    'W1543868378742489088'
  );

COMMIT;

-- ----------------------------
-- Table structure for li_recharge
-- ----------------------------
DROP TABLE IF EXISTS `li_recharge`;

CREATE TABLE `li_recharge` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员id',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `pay_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付状态',
  `payment_plugin_id` bigint DEFAULT NULL COMMENT '支付插件id',
  `recharge_money` double DEFAULT NULL COMMENT '充值金额',
  `recharge_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '充值订单编号',
  `recharge_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '充值方式',
  `pay_time` datetime(6) DEFAULT NULL COMMENT '支付时间',
  `receivable_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方流水',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '充值表';

-- ----------------------------
-- Records of li_recharge
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_short_link
-- ----------------------------
DROP TABLE IF EXISTS `li_short_link`;

CREATE TABLE `li_short_link` (
  `id` bigint NOT NULL COMMENT 'ID',
  `original_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原始参数',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '短链接表';

-- ----------------------------
-- Records of li_short_link
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_store
-- ----------------------------
DROP TABLE IF EXISTS `li_store`;

CREATE TABLE `li_store` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员Id',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `self_operated` bit(1) NOT NULL COMMENT '是否自营',
  `store_disable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺状态',
  `store_end_time` datetime(6) DEFAULT NULL COMMENT '店铺关闭时间',
  `store_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺logo',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `store_address_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址',
  `store_address_id_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址id',
  `store_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址名称',
  `store_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '经纬度',
  `store_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺简介',
  `delivery_score` double(10, 2) DEFAULT NULL COMMENT '物流评分',
  `description_score` double(10, 2) DEFAULT NULL COMMENT '描述评分',
  `service_score` double(10, 2) DEFAULT NULL COMMENT '服务评分',
  `goods_num` int DEFAULT NULL COMMENT '商品数量',
  `collection_num` int DEFAULT NULL COMMENT '收藏数量',
  `yzf_mp_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `yzf_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `merchant_euid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客服标识',
  `page_show` bit(1) NULL DEFAULT NULL COMMENT '默认页面是否开启',
  `self_pick_flag` bit(1) DEFAULT NULL COMMENT '是否支持自提',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '店铺表';

-- ----------------------------
-- Records of li_store
-- ----------------------------
BEGIN;

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1376369067769724928,
    'admin',
    '2021-03-28 22:02:12.109000',
    0,
    'admin',
    '2021-08-26 15:39:48.264000',
    1376364798236688384,
    '15810610731',
    1,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/e3e1c6ef28a844f98a0c907bd74a4085.png',
    'Lilishop自营店',
    '北京五道口',
    '1371783043718578711,1371783043718578712,1371783043722772487,1371783043722772492',
    '北京市 北京城区 海淀区 学院路街道',
    '39.992552,116.338611',
    'Lilishop自营店简介',
    4.25,
    4.25,
    5.00,
    54,
    3,
    '4a971f4f4ff9637cd9286a0197b0573bf2f65de052c21791f90d4235fca41456e1cc145075567f5f47b8e13c895f3fc8cacec5789f9afee8df670f7cbe5c0f82',
    '37ef9b97807d03c6741298ed4eb5b536d2d238e08a3c00fb01fe48f03a569974c99ad767e72c04b3165ef29aca2c488b505fe4ca',
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1376433565247471616,
    'admin',
    '2021-03-29 02:18:29.507000',
    0,
    'admin',
    '2021-08-30 16:11:05.189000',
    1376417684140326912,
    '13011111111',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f6fab112b9924e7e8bcd5de646807866.jpeg',
    '生活百货1',
    '家家乐超市',
    '1401797451806932992,1401797451811127939,1401797451811128008,1401797451811128017',
    '山西省 运城市 闻喜县 礼元镇',
    '116.704441,39.523927',
    '<p>店铺简介对伐啦撒打飞机卡私聊对方对方估计很快了&nbsp; &nbsp; &nbsp;&nbsp;</p>',
    4.25,
    4.20,
    4.50,
    158,
    6,
    '32b8ff6f8d1c240be8d7fe51bdd6d44a6776ea86930afbe5c3c342825e942c914fc6126b6be1f003ab04aee1af9f442d2c33e1427529300671588866edaa4b12',
    '37ef9b97807d03c6741298ed4eb5b536d2d238e08a3c00fb01fe48f03a569974c99ad767e72c04b3165ef29aca2c488b505fe4ca',
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1394544191052185600,
    'abcaa',
    '2021-05-18 14:43:39.182000',
    0,
    'admin',
    '2021-06-15 19:56:45.285000',
    1394193777396023296,
    'abcaa',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/c4b0551524e34610bfe0fa52e1f800ec.jpeg',
    'lili电器自营店',
    NULL,
    NULL,
    NULL,
    '116.704441,39.523927',
    '大牌电器一网打尽',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1395290762412818432,
    'zhows',
    '2021-05-20 16:10:15.665000',
    0,
    'admin',
    '2021-05-28 14:26:42.822000',
    1395290425983500288,
    'zhows',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/dd534eb345f141a0b4c33bebfd87cd67.png',
    '测试公司',
    NULL,
    NULL,
    NULL,
    '120.153576,30.287459',
    '12312313',
    5.00,
    5.00,
    5.00,
    1,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1400751938689040384,
    'admin',
    '2021-06-04 17:51:01.553000',
    0,
    'admin',
    '2021-06-11 11:25:49.323000',
    1400361287958921216,
    'm17792184721',
    0,
    'OPEN',
    NULL,
    NULL,
    '测试007',
    '福建',
    NULL,
    NULL,
    NULL,
    '测试店铺测试店铺测试店铺测试店铺',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1403929516804681729,
    'admin1',
    '2021-06-13 12:17:35.213000',
    0,
    'admin',
    '2021-07-08 11:37:20.665000',
    1403928259801133058,
    'admin1',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1f19d0dd177647269d3043304dddcfa5.PNG',
    '好人店铺',
    NULL,
    NULL,
    NULL,
    '120.153576,30.287459',
    '测试一下店铺介绍',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1407544184974721026,
    'test1',
    '2021-06-23 11:40:59.262000',
    0,
    'admin',
    '2021-06-30 11:44:56.049000',
    1407537451145478146,
    'test1',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/6ec27a3a3f9443f28abeb565f67732fe.jpg',
    'test',
    NULL,
    NULL,
    NULL,
    '113.095929,23.565848',
    'xxx',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1407570137180389378,
    'test',
    '2021-06-23 13:24:06.749000',
    0,
    'admin',
    '2021-07-05 17:47:36.809000',
    1399288118133129216,
    'test',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/dcb1d8e29145454991080f13b5c7a1e6.jpg',
    '123',
    NULL,
    NULL,
    NULL,
    '113.231199,23.190835',
    '111',
    5.00,
    5.00,
    5.00,
    1,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1409325908893179906,
    'adam',
    '2021-06-28 09:40:55.347000',
    0,
    'admin',
    '2021-06-28 09:57:08.556000',
    1409322599235002370,
    'adam',
    0,
    'REFUSED',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/7e5cd08afd654044bec94fdcd77c5100.jpeg',
    '132',
    NULL,
    NULL,
    NULL,
    '116.704441,39.523927',
    'jianjie',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1410080768856948738,
    'd2a1515b97d95bb5fa6e0291513e4d03',
    '2021-06-30 11:40:27.988000',
    0,
    'd2a1515b97d95bb5fa6e0291513e4d03',
    '2021-06-30 14:49:47.246000',
    1409813591243440130,
    'd2a1515b97d95bb5fa6e0291513e4d03',
    0,
    'APPLY',
    NULL,
    NULL,
    NULL,
    'asdff',
    '1401797451504943104,1401797451509137428,1401797451509137442,1401797451509137444',
    '广东省,佛山市,高明区,明城镇',
    NULL,
    NULL,
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1410520556785434625,
    'admin',
    '2021-07-01 16:48:01.601000',
    0,
    'admin',
    '2021-07-01 16:49:33.088000',
    1410506132255219714,
    'm19913885738',
    0,
    'REFUSED',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f883869b6b4448d5ab7c76f3eb21fde0.jpg',
    '测试部门数据',
    '大是大非',
    '1401797451504943104,1401797451521720973,1401797451521721098,1401797451521721107',
    '广东省 广州市 天河区 沙河街道',
    '23.14491,113.309047',
    '21321我去323213',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1413008622955655170,
    'admin',
    '2021-07-08 13:34:42.809000',
    0,
    'admin',
    '2021-07-20 14:01:25.467000',
    1412979561709527042,
    'm17780631385',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/6b625905f78a45caa5402edf05dd385b.jpg',
    '生鲜商超',
    '那关岭',
    '1401797451580440758,1401797451580440759,1401797451580440886,1401797451580440892',
    '上海市 上海城区 黄浦区 南京东路街道',
    '31.231706,121.472644',
    '经营海产品，蔬菜配送',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1413115175788474369,
    'admin',
    '2021-07-08 20:38:06.975000',
    0,
    'admin',
    '2021-07-09 14:41:54.640000',
    1413114065296158722,
    '梁英俊',
    0,
    'OPEN',
    NULL,
    NULL,
    '123456789',
    'asdfasdfasdfasdf',
    '1401797451504943104,1401797451521720973,1401797451521721120,1401797451521721123',
    '广东省 广州市 越秀区 大东街道',
    '23.125178,113.280637',
    'asdfasdfasdfasdf',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1413749887712206849,
    'admin',
    '2021-07-10 14:40:14.095000',
    0,
    'admin',
    '2022-07-01 14:20:55.165000',
    1412310886434213889,
    'admin',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/4db5145bfd354d9dbea000c4150441ab.png',
    '君和',
    '华强路2号',
    '1401797451504943104,1401797451521720973,1401797451521721098,1401797451521721102',
    '广东省,广州市,天河区,猎德街道',
    '113.280637,23.125178',
    '经营各种家电',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1414392847239847938,
    'demo',
    '2021-07-12 09:15:07.587000',
    0,
    'admin',
    '2021-08-05 18:11:59.618000',
    1414392247731200002,
    'demo',
    0,
    'CLOSED',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/9db24b44ad70428c91f618ddce2207b8.png',
    'demo',
    'demo',
    '1401797451504943104,1401797451504943105,1401797451504943120,1401797451504943122',
    '广东省,汕头市,澄海区,莲下镇',
    '100.999705,25.647183',
    '1111111',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1414587636824518657,
    'demo111',
    '2021-07-12 22:09:09.047000',
    0,
    'admin',
    '2021-07-26 15:27:56.231000',
    1414587334998208514,
    'demo111',
    0,
    'REFUSED',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/b2d448d2aa8e472d8ac59f263f2b3548.png',
    'demo111',
    '1',
    '1401797451530109606,1401797451534303320,1401797451534303322',
    '新疆维吾尔自治区,铁门关市,双丰镇',
    '113.14834,23.123094',
    '111111111111111111',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1414784513457098753,
    'admin',
    '2021-07-13 11:11:28.091000',
    0,
    'admin',
    '2021-07-13 17:43:37.712000',
    1414783233061916673,
    'XYP',
    0,
    'REFUSED',
    NULL,
    NULL,
    'XYP',
    '123124',
    '1401797451790156093,1401797451790156094,1401797451790156378,1401797451790156385',
    '北京市 北京城区 丰台区 宛平城镇',
    '39.809338,116.261963',
    '234123',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1415571739086524418,
    'admin',
    '2021-07-15 15:19:37.307000',
    0,
    'admin',
    '2021-07-20 16:09:02.744000',
    1415570220916248577,
    'hh',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f245699c53154c99b784e0231c965b80.png',
    '行侠仗义',
    '春熙路横街',
    '1401797451727241414,1401797451731435599,1401797451731435831,1401797451731435844',
    '四川省 成都市 锦江区 春熙路街道',
    '30.65555,104.077795',
    '想干啥就干啥',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1417411608863641602,
    'xwp',
    '2021-07-20 17:10:36.444000',
    0,
    'admin',
    '2021-07-26 17:50:19.574000',
    1417410661773021185,
    'xwp',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/90ce9441a7d24af88a2709b6b6f83088.png',
    '小巫婆百货',
    '不知道',
    '1401797451580440758,1401797451580440759,1401797451580440760,1401797451580440762',
    '上海市,上海城区,浦东新区,洋泾街道',
    '119.548625,26.19828',
    '你猜',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1419829515207864322,
    'admin',
    '2021-07-27 09:18:30.243000',
    0,
    'admin',
    '2022-06-14 15:34:54.547000',
    1419828080076419073,
    '陈潜根',
    0,
    'OPEN',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/4b97806335284c1496769b9686bd6517.jpg',
    '陈潜根的小店1',
    '湘雅二医院',
    '1401797451676909955,1401797451676910250,1401797451676910415,1401797451676910416',
    '湖南省 长沙市 芙蓉区 文艺路街道',
    '28.187849,112.993694',
    '最大的药店最大的药店最大的药店最大的药店最大的药店',
    5.00,
    5.00,
    5.00,
    0,
    0,
    'null',
    'null',
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1420677813745532930,
    '4ff767d72c37521b3e543b581bd0ba15',
    '2021-07-29 17:29:20.373000',
    0,
    NULL,
    NULL,
    1410872293467709442,
    '4ff767d72c37521b3e543b581bd0ba15',
    0,
    'APPLY',
    NULL,
    NULL,
    NULL,
    '1',
    '1401797451504943104,1401797451504943105,1401797451504943120,1401797451504943122',
    '广东省,汕头市,澄海区,莲下镇',
    NULL,
    NULL,
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1425437136798117889,
    'abcc',
    '2021-08-11 20:41:11.413000',
    0,
    'abcc',
    '2021-08-11 22:11:20.356000',
    1425433055413170178,
    'abcc',
    0,
    'APPLYING',
    NULL,
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/291ac578699644c6a17e463812364a36.jpeg',
    '13123',
    '店铺详细地址',
    '1401797451504943104,1401797451504943105,1401797451504943120,1401797451504943122',
    '广东省,汕头市,澄海区,莲下镇',
    '116.704441,39.523927',
    '简介',
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `member_id`,
    `member_name`,
    `self_operated`,
    `store_disable`,
    `store_end_time`,
    `store_logo`,
    `store_name`,
    `store_address_detail`,
    `store_address_id_path`,
    `store_address_path`,
    `store_center`,
    `store_desc`,
    `delivery_score`,
    `description_score`,
    `service_score`,
    `goods_num`,
    `collection_num`,
    `yzf_mp_sign`,
    `yzf_sign`,
    `merchant_euid`
  )
VALUES
  (
    1425450340110594049,
    'acc',
    '2021-08-11 21:33:39.327000',
    0,
    'acc',
    '2021-08-11 22:03:50.152000',
    1425450071696109569,
    'acc',
    0,
    'APPLY',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    5.00,
    5.00,
    5.00,
    0,
    0,
    NULL,
    NULL,
    NULL
  );

COMMIT;

-- ----------------------------
-- Table structure for li_store_address
-- ----------------------------
DROP TABLE IF EXISTS `li_store_address`;

CREATE TABLE `li_store_address` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `address_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '自提点名称',
  `center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '经纬度',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '电话',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '自提点表';

-- ----------------------------
-- Records of li_store_address
-- ----------------------------
BEGIN;

INSERT INTO
  `li_store_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `address`,
    `address_name`,
    `center`,
    `mobile`,
    `store_id`
  )
VALUES
  (
    1385117712077815808,
    '13011111111',
    '2021-04-22 14:26:11',
    0,
    '13011111111',
    '2021-08-03 09:37:10',
    '北京市丰台区右安门街道北京南站',
    '自提点2444',
    '39.865246,116.378517',
    '13811234567',
    1376433565247471616
  );

INSERT INTO
  `li_store_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `address`,
    `address_name`,
    `center`,
    `mobile`,
    `store_id`
  )
VALUES
  (
    1412241054401622017,
    '13011111111',
    '2021-07-06 10:44:40',
    0,
    NULL,
    NULL,
    '山东省青岛市市南区八大湖街道博思公寓',
    '额',
    '36.082813,120.37626',
    '18574782681',
    1376433565247471616
  );

INSERT INTO
  `li_store_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `address`,
    `address_name`,
    `center`,
    `mobile`,
    `store_id`
  )
VALUES
  (
    1412650858697797634,
    '13011111111',
    '2021-07-07 13:53:05',
    0,
    '13011111111',
    '2021-07-14 16:56:50',
    '山东省济南市天桥区官扎营街道济南站',
    '12',
    '36.67149,116.99058',
    '18399999999',
    1376433565247471616
  );

INSERT INTO
  `li_store_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `address`,
    `address_name`,
    `center`,
    `mobile`,
    `store_id`
  )
VALUES
  (
    1416973824579416066,
    '15810610731',
    '2021-07-19 12:11:01',
    0,
    '15810610731',
    '2021-07-19 12:12:16',
    '北京市丰台区太平桥街道北京西站',
    '猜猜猜',
    '39.89491,116.322056',
    '13213131312',
    1376369067769724928
  );

INSERT INTO
  `li_store_address` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `address`,
    `address_name`,
    `center`,
    `mobile`,
    `store_id`
  )
VALUES
  (
    1417650866920710145,
    '13011111111',
    '2021-07-21 09:01:20',
    0,
    NULL,
    NULL,
    '湖南省怀化市鹤城区城南街道池回收费站(S97怀化绕城高速入口池回高速方向)',
    'chihui ',
    '27.485036,109.948879',
    '18692234580',
    1376433565247471616
  );

COMMIT;

-- ----------------------------
-- Table structure for li_store_collection
-- ----------------------------
DROP TABLE IF EXISTS `li_store_collection`;

CREATE TABLE `li_store_collection` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '店铺收藏表';

-- ----------------------------
-- Records of li_store_collection
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_store_detail
-- ----------------------------
DROP TABLE IF EXISTS `li_store_detail`;

CREATE TABLE `li_store_detail` (
  `id` bigint NOT NULL COMMENT 'ID',
  `company_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司地址',
  `company_address_id_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司地址地区ID',
  `company_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司地址地区',
  `company_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '电子邮箱',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司名称',
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司电话',
  `dd_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '同城配送达达店铺编码',
  `employee_num` int DEFAULT NULL COMMENT '员工总数',
  `goods_management_category` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '店铺经营类目',
  `legal_id` bigint DEFAULT NULL COMMENT '法人身份证',
  `legal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '法人姓名',
  `legal_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '法人身份证照片',
  `licence_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '营业执照电子版',
  `license_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '营业执照号',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人姓名',
  `link_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人电话',
  `registered_capital` double(10, 2) DEFAULT NULL COMMENT '注册资金',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '法定经营范围',
  `settlement_bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结算银行开户行名称',
  `settlement_bank_account_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结算银行开户账号',
  `settlement_bank_branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结算银行开户支行名称',
  `settlement_bank_joint_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结算银行支行联行号',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `stock_warning` int DEFAULT NULL COMMENT '库存预警数量',
  `settlement_cycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结算周期',
  `sales_consignee_address_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退货地址Id',
  `sales_consignee_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退货地址名称',
  `sales_consignee_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退货详细地址',
  `sales_consignee_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退货收件人手机',
  `sales_consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退货收货人姓名',
  `sales_consignor_address_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发货地址id',
  `sales_consignor_address_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发货地址名称',
  `sales_consignor_detail` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发货详细地址',
  `sales_consignor_mobile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发货人手机',
  `sales_consignor_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发货人姓名',
  `settlement_day` datetime(6) DEFAULT NULL COMMENT '店铺上次结算日',
  `sub_mchid` varchar(64) DEFAULT NULL COMMENT '店铺二级商户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '店铺详情表';

-- ----------------------------
-- Records of li_store_detail
-- ----------------------------
BEGIN;

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1376369068555857921,
    '公司详细地址',
    '1371783040048562731,1371783040048562732,1371783040048562834,1371783040048562835',
    '上海市 , 上海城区 , 黄浦区 , 淮海中路街道',
    'a@aa.com',
    '北京宏业汇成科技有限公司',
    '13232323232',
    NULL,
    111,
    '1348576427264204941,1348576427268399553,1348576427260010496,1348576427268399363,1348576427268399172,1348576427268399318,1348576427268399274,1348576427268399217,1348576427268399486,1348576427268399674',
    133552199004050306,
    '张三',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/62879a7747f4498699cc1753f88b8d70.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/62879a7747f4498699cc1753f88b8d70.png',
    '91110113MA01LM5H3X',
    '张三',
    '13333332222',
    500.00,
    '技术开发、技术咨询、技术转让、技术推广、技术服务；销售服装鞋帽、日用品、玩具、新鲜蔬菜、针纺织品、文化用品、体育用品（不含弩）、家用电器、电子产品、计算机、软件及辅助设备；软件开发；基础软件服务；应用软件服务；设计、制作、代理、发布广告；承办展览展示活动；会议服务；包装装潢设计；模型设计；计算机系统集成服务；信息咨询；(不含中介服务)',
    '北京宏业汇成科技有限公司',
    '16333322333',
    '光大银行五道口支行',
    '553232',
    1376369067769724928,
    'Lilishop自营店',
    10,
    '1,26',
    '1371783040048562731,1371783040048562732,1371783040048562834,1371783040048562835',
    '上海市 , 上海城区 , 黄浦区 , 淮海中路街道',
    '详细地址',
    '13333333333',
    '张三',
    '2021-08-26 15:40:47.675000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1376433566338019329,
    '详细地址',
    '1371783043718578711,1371783043718578712,1371783043718578732,1371783043718578734',
    '北京市 , 北京城区 , 怀柔区 , 琉璃庙镇',
    'a@aa.com',
    '北京宏业汇成科技有限公司',
    '0316-3417993',
    NULL,
    10000,
    '1414475616154390529,1348576427264204941,1348576427268399318,1348576427268399674',
    150132199008020635,
    '张三',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/62879a7747f4498699cc1753f88b8d70.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/62879a7747f4498699cc1753f88b8d70.png',
    '91110113MA01LM5H3X',
    '张三',
    '13333333333',
    10000.00,
    '技术开发、技术咨询、技术转让、技术推广、技术服务；销售服装鞋帽、日用品、玩具、新鲜蔬菜、针纺织品、文化用品、体育用品（不含弩）、家用电器、电子产品、计算机、软件及辅助设备；软件开发；基础软件服务；应用软件服务；设计、制作、代理、发布广告；承办展览展示活动；会议服务；包装装潢设计；模型设计；计算机系统集成服务；信息咨询；(不含中介服务)',
    '北京宏业汇成科技有限公司',
    '20101001',
    '支行',
    '2582222',
    1376433565247471616,
    '生活百货1',
    2,
    '1,10,15,20,25,28',
    '1401797451530109606,1401797451534303280,1401797451534303293,1401797451534303295',
    '新疆维吾尔自治区 , 博尔塔拉蒙古自治州 , 阿拉山口市 , 阿拉套街道',
    '详细地址1233',
    '13333333333',
    '张',
    '2021-08-01 02:05:00.117000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1394544191171026945,
    '43213',
    NULL,
    NULL,
    'a@qq.com',
    '1233',
    NULL,
    NULL,
    111,
    '1348576427264204941,1348576427268399553',
    131082199302512513,
    'zs',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/e913b686fb9640a3a20de2145885367c.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/75df095d4c0643a4adbb264d850e1dcc.jpg',
    '123432132123421',
    'zs',
    '18632625773',
    333.00,
    '12343',
    '张三',
    '6222020410016130057',
    '中国工商银行燕郊支行',
    '321312431',
    1394544191052185600,
    'lili电器自营店',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1395290762556805121,
    NULL,
    NULL,
    NULL,
    'xiaoyou91@vip.qq.com',
    '测试公司',
    NULL,
    NULL,
    1,
    '1348576427260010496',
    324234422342334,
    '测试公司',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/e2dfd8d40cd14428a6c7798c28fed408.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/a7b0f45ac9944573af674088942d447e.png',
    '123123123123123',
    '测试公司',
    '18019075151',
    1.00,
    '测试公司测试公司测试公司测试公司',
    '测试公司',
    '13142342352352352522',
    '12312',
    '123123',
    1395290762412818432,
    '测试公司',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1400751938833072130,
    '123',
    NULL,
    NULL,
    '123@qq.com',
    '123',
    '123',
    NULL,
    1123,
    '1348576427260010496',
    123123123123123123,
    '123',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/a54d188227cb4b6f998d5843ba823a1a.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/a54d188227cb4b6f998d5843ba823a1a.png',
    '123123123123123123',
    '123',
    '13512345612',
    1.00,
    '123',
    '123',
    '123',
    '123',
    '123',
    1400751938689040384,
    '测试007',
    10,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-06-04 17:51:01.585000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1403929516922122241,
    NULL,
    NULL,
    NULL,
    'test@163.com',
    '电商平台',
    NULL,
    NULL,
    5,
    '1348576427264204941',
    210203197112134033,
    '高',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/b02d960fb7f74621a9135ed2e7af4083.PNG',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/564fc30115b34fc1a02681cde46c5de8.PNG',
    '91500117MA6047RM0C',
    '高',
    '13818040096',
    1111.00,
    '经营范围',
    '1',
    '1',
    '1',
    '1',
    1403929516804681729,
    '好人店铺',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1407544184983109633,
    NULL,
    NULL,
    NULL,
    '2352145258@163.com',
    'xx',
    NULL,
    NULL,
    10000,
    '1348576427268399363',
    440582188804150201,
    'xx',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/e5252a7bab174a7abf307100001a689f.jpg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/eadf3034ba84494791da8aa3bf5b09dc.jpg',
    '111111111111111',
    'xx',
    '15112345678',
    1000000.00,
    'xx',
    '广东',
    '6251003200005284223',
    '广东',
    '66666',
    1407544184974721026,
    'test',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1407570137184583682,
    NULL,
    NULL,
    NULL,
    '15713265123@163.com',
    '123',
    NULL,
    NULL,
    11111111,
    '1348576427264204941,1348576427268399363',
    111111111111111111,
    '11111',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/d59d2afcfdba4a5ab915940a6a641ee0.jpg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/afe280581c3949feaf10f8df4787725f.jpg',
    '111111111111111',
    'sir chen',
    '15713265123',
    11111111.00,
    '11',
    '111',
    '111',
    '11',
    '11',
    1407570137180389378,
    '123',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1409325909077729282,
    NULL,
    NULL,
    NULL,
    '1@qq.com',
    '134',
    NULL,
    NULL,
    51,
    '1348576427268399553,1348576427260010496,1348576427268399172',
    123412342312342142,
    '123',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/7c63c77e6bb94ed591f2168a7ad33075.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/a691a171711140c18221bb2e88b757f7.jpeg',
    '123421312412341',
    '134',
    '18632625773',
    55.00,
    '1234',
    '1234',
    '123',
    '1233',
    '123124',
    1409325908893179906,
    '132',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1410080769393819650,
    NULL,
    NULL,
    NULL,
    '1018841732@qq.com',
    'sadfwdf',
    '15676789890',
    NULL,
    45,
    NULL,
    359098766576768976,
    'asdfa',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/61e23e34d7864ad0aec869a934115267.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/0841c7287b4b4d049c0f793fe58d087b.png',
    '91350111MA337C6Y21',
    'huangqiongxia',
    '17878789890',
    5000.00,
    'asdfasdf',
    '中国银行股份有限公司福建省分行',
    '418278662380',
    '中国银行股份有限公司福建省分行',
    '418278662380',
    1410080768856948738,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1410520557318111233,
    '213213213213',
    '1401797451504943104,1401797451521720973,1401797451521721098,1401797451521721101',
    '广东省 , 广州市 , 天河区 , 员村街道',
    'llhong522@163.com',
    '12321321',
    '111112222',
    '23432432',
    11,
    '1348576427264204941',
    222223333444444555,
    '213213',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f883869b6b4448d5ab7c76f3eb21fde0.jpg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f883869b6b4448d5ab7c76f3eb21fde0.jpg',
    '111111111111111111',
    '21321321',
    '15315799360',
    1.00,
    '213213',
    '213213',
    '213213',
    '213213',
    '213213',
    1410520556785434625,
    '测试部门数据',
    10,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-07-01 16:48:01.725000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1413008623152787458,
    '批发市场',
    '1401797451521721163,1401797451525914753,1401797451525914865,1401797451525914868',
    '辽宁省 , 大连市 , 甘井子区 , 南关岭街道',
    'rensr@163.com',
    '一篮优品',
    '13898637638',
    '123456',
    20,
    '1348576427268399274',
    612133197607255416,
    '111111111111',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/7ca0f5160dcb471b84e4f981527d36ff.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/8b3751f9cbcb4203978b0125cc48f0ed.jpg',
    '111111111111111111',
    'XXX',
    '13898627628',
    100.00,
    '11111111111',
    '111111111111',
    '111111111111',
    '11111111111',
    '1111111111111',
    1413008622955655170,
    '生鲜商超',
    10,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-07-08 13:35:27.360000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1413115175876554754,
    'asdfasdf',
    NULL,
    NULL,
    '1197890431@qq.com',
    'asdfasdf',
    '63330235',
    NULL,
    1,
    '1348576427264204941,1410593451570167809,1412666845430128642,1348576427268399553,1405359839555944449,1411170003265556482,1348576427260010496,1348576427268399363,1348576427268399172,1348576427268399318,1348576427268399274,1348576427268399217,1348576427268399486,1348576427268399674',
    445555896362111585,
    'qwerqwe',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/7ca0f5160dcb471b84e4f981527d36ff.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1a2e37c280c74abcb3dd243814f2eefe.png',
    'kloksmjdidjkdididi',
    'asdfas',
    '13126258204',
    1.00,
    'rqwerqwer',
    'qwerq',
    'werqw',
    'erqwer',
    'qwer',
    1413115175788474369,
    '123456789',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-07-08 20:39:56.712000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1413749887867396098,
    NULL,
    NULL,
    NULL,
    '565007180@qq.com',
    '百年商帮信息科技',
    '15934561356',
    NULL,
    100,
    '1348576427268399553',
    310220197408043624,
    '刘生',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/d338e3824456411f90128c22032ef2ee.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/8c1e71aff052438081ca8b944db9618d.png',
    '110108001372310',
    '刘玉堂',
    '15934561356',
    1000.00,
    '计算机软件',
    '工商银行',
    '62263602234565795',
    '东山支行',
    '456783',
    1413749887712206849,
    '君和',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-07-10 14:49:29.894000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1414392847353094145,
    'xx',
    NULL,
    NULL,
    '15713265895@163.com',
    'xx',
    '15713265895',
    NULL,
    1000,
    '1348576427264204941',
    440582188804140101,
    'sir chen',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/663efae107444b4c82a692e752f9cc71.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/74901ec4858c4627b3e7054afc305720.png',
    '111111111111111111',
    'sir chen',
    '15713265895',
    1000.00,
    'demo',
    '1',
    '1',
    '1',
    '1',
    1414392847239847938,
    'demo',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-07-12 09:17:15.952000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1414587637004873730,
    NULL,
    NULL,
    NULL,
    '15713265895@163.com',
    '1',
    '15713265895',
    NULL,
    1,
    '1405359839555944449,1348576427264204941',
    111111111111111111,
    '1',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/630612243530446aa9ef9005e0d1796c.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/190890d910cd43a5b095c0fc22872d9a.png',
    '111111111111111111',
    'sir chen',
    '15713265895',
    111111.00,
    '111111111111111111',
    '1',
    '1',
    '1',
    '1',
    1414587636824518657,
    'demo111',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1414784513603899393,
    '123',
    '1401797451504943104,1401797451504943105,1401797451504943106,1401797451504943107',
    '广东省 , 汕头市 , 潮阳区 , 和平镇',
    '123456@163.com',
    '许一',
    '13391221111',
    NULL,
    1,
    '1348576427264204941,1410593451570167809,1348576427268399553,1405359839555944449,1414475616154390529,1348576427260010496,1348576427268399363,1348576427268399172,1348576427268399318,1348576427268399274,1348576427268399217,1348576427268399486,1348576427268399674',
    340304199508029404,
    '许一',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/247eb849a789438baeedb6ebd836b857.jpg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/247eb849a789438baeedb6ebd836b857.jpg',
    '123343215678965432',
    '许一',
    '13391221111',
    1.00,
    'wrtqwqrt',
    '41236541345',
    '542356346',
    '452135',
    '12351423',
    1414784513457098753,
    'XYP',
    10,
    NULL,
    '1401797451504943104,1401797451509137428,1401797451509137442,1401797451509137444',
    '广东省 , 佛山市 , 高明区 , 明城镇',
    '13421',
    '13391221234',
    '张三',
    '2021-07-13 11:11:28.127000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1415571739170410498,
    '新疆的犄角旮旯',
    '1401797451530109606,1401797451530109607,1401797451530109608,1401797451530109609',
    '新疆维吾尔自治区 , 和田地区 , 于田县 , 兰干乡',
    '156788@qq.com',
    'hh',
    '13554564565',
    NULL,
    1,
    '1348576427264204941,1410593451570167809,1348576427268399553,1405359839555944449,1414475616154390529',
    111111111111111111,
    '11',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/4c3dcb10fdb247568f08357062de0a5a.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/4c3dcb10fdb247568f08357062de0a5a.jpeg',
    '111111111111111111',
    'hh',
    '13554564565',
    1.00,
    '11',
    '1',
    '1',
    '1',
    '1',
    1415571739086524418,
    '行侠仗义',
    10,
    NULL,
    '1401797451588829589,1401797451588829590,1401797451588829622,1401797451588829624',
    '重庆市 , 重庆城区 , 潼南区 , 别口镇',
    '磁器口',
    '13554564565',
    'hh',
    '2021-07-15 15:22:28.364000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1417411608955916289,
    NULL,
    NULL,
    NULL,
    '142637246@qq.com',
    '小巫婆百货',
    '0872-6524142',
    NULL,
    99,
    '1348576427264204941,1410593451570167809,1348576427268399553,1405359839555944449,1414475616154390529,1348576427268399172,1348576427268399318',
    325372519871221,
    '小巫婆',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/2139f4b9e20d45d7a27020faf9ff6e06.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/c8fc9544c1304873890b69cf7d1efc46.png',
    '91210211MA327C6Y24',
    '小巫婆',
    '17253645722',
    100.00,
    '很多范围',
    '天地银行',
    '132535617827521',
    '水帘洞',
    '7255633',
    1417411608863641602,
    '小巫婆百货',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-07-20 17:12:39.862000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1419829515367247874,
    '长沙',
    '1401797451676909955,1401797451676910250,1401797451676910270,1401797451676910272',
    '湖南省 , 长沙市 , 开福区 , 四方坪街道',
    '476051351@qq.com',
    '特格尔',
    '6997994',
    'null',
    1000,
    '1348576427264204941,1410593451570167809,1415219288827334658,1418455766189543426,1418570427694125057,1418571069913370625,1348576427268399553,1405359839555944449,1414475616154390529,1348576427260010496,1348576427268399363,1348576427268399172,1348576427268399318,1348576427268399274,1348576427268399217,1348576427268399486,1348576427268399674',
    111111111111111111,
    '陈潜根',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/e2f23b4b05be42b5b6b5a22fc9be5192.jpg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/51b38a8de40a4f0fa13964e9c007f6c3.jpg',
    '111111111111111111',
    '陈潜根',
    '15273201080',
    10000.00,
    '1111',
    '11111',
    '11111',
    '1111',
    '11111',
    1419829515207864322,
    '陈潜根的小店1',
    10,
    '1,31',
    '1401797451676909955,1401797451676910250,1401797451676910400,1401797451676910401',
    '湖南省 , 长沙市 , 天心区 , 黑石铺街道',
    '长沙黑石',
    '18075159171',
    '海哥',
    '2021-07-27 09:18:57.198000'
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1420677814139797506,
    NULL,
    NULL,
    NULL,
    '1450628865@qq.com',
    '1',
    '2222',
    NULL,
    1,
    NULL,
    352164262461523,
    'ss',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f6af9957c80c4a2e91b49a1b9deccaf7.png',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/f0993388b88b48589d2d7a211b0877e6.png',
    '91330106070976527B',
    '22',
    '17850805920',
    1.00,
    'qq',
    'xxx',
    'xxxx',
    'xxxx',
    'xxxx',
    1420677813745532930,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1425437137045581825,
    '122131',
    '1401797451504943104,1401797451504943105,1401797451504943106,1401797451504943107',
    '广东省,汕头市,潮阳区,和平镇',
    '1@qq.com',
    '12312',
    '010-1342343',
    NULL,
    12,
    '1348576427264204941,1422529040389242881,1348576427268399553',
    130151265812541,
    'zs',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/da67b057c4fd4a809331ebdd9e549e49.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/4fc7d843c1fe4d0b8193598e9057dde3.jpeg',
    '123432142314213',
    '123',
    '18632625773',
    12.00,
    '123124',
    '123',
    '4123',
    '4213',
    '412312',
    1425437136798117889,
    '13123',
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

INSERT INTO
  `li_store_detail` (
    `id`,
    `company_address`,
    `company_address_id_path`,
    `company_address_path`,
    `company_email`,
    `company_name`,
    `company_phone`,
    `dd_code`,
    `employee_num`,
    `goods_management_category`,
    `legal_id`,
    `legal_name`,
    `legal_photo`,
    `licence_photo`,
    `license_num`,
    `link_name`,
    `link_phone`,
    `registered_capital`,
    `scope`,
    `settlement_bank_account_name`,
    `settlement_bank_account_num`,
    `settlement_bank_branch_name`,
    `settlement_bank_joint_name`,
    `store_id`,
    `store_name`,
    `stock_warning`,
    `settlement_cycle`,
    `sales_consignee_address_id`,
    `sales_consignee_address_path`,
    `sales_consignee_detail`,
    `sales_consignee_mobile`,
    `sales_consignee_name`,
    `settlement_day`
  )
VALUES
  (
    1425450340190285826,
    '12312',
    '1401797451521721163,1401797451525914753,1401797451525914754,1401797451525914755',
    '辽宁省,大连市,瓦房店市,谢屯镇',
    '1@q.com',
    '12314',
    '010-1253584',
    NULL,
    111,
    NULL,
    412342134231423,
    '123',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/8ebdfd675c5b4a4d93e8f8afca1423c2.jpeg',
    'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/84f442e29ee9476382cae1ab4a1c6c40.jpeg',
    '132144312343213',
    '1',
    '18632625773',
    11.00,
    '1231',
    '123',
    '4123',
    '123',
    '42131',
    1425450340110594049,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

COMMIT;

-- ----------------------------
-- Table structure for li_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `li_wallet_log`;

CREATE TABLE `li_wallet_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志明细',
  `member_id` bigint DEFAULT NULL COMMENT '会员id',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `money` double DEFAULT NULL COMMENT '金额',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '钱包日志表';

-- ----------------------------
-- Records of li_wallet_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;

CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;

COMMIT;

-- member 库
-- ----------------------------
-- Table structure for li_clerk
-- ----------------------------
DROP TABLE IF EXISTS `li_clerk`;

CREATE TABLE `li_clerk` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `clerk_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店员名称',
  `member_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '会员id',
  `store_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店铺id',
  `department_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门id',
  `role_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色',
  `shopkeeper` bit(1) NULL DEFAULT NULL COMMENT '是否是店主',
  `is_super` bit(1) NULL DEFAULT NULL COMMENT '是否是超级管理员 超级管理员/普通管理员',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic COMMENT = '店员表';

-- ----------------------------
-- Records of li_clerk
-- ----------------------------
BEGIN;
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1376369067769724928, '15810610731', '2023-03-31 00:00:00', null, null, null, '15810610731', '1376364798236688384', '1376369067769724928', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1376433565247471616, '13011111111', '2023-03-31 00:00:00', null, null, null, '13011111111', '1376417684140326912', '1376433565247471616', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1394544191052185600, 'abcaa', '2023-03-31 00:00:00', null, null, null, 'abcaa', '1394193777396023296', '1394544191052185600', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1395290762412818432, 'zhows', '2023-03-31 00:00:00', null, null, null, 'zhows', '1395290425983500288', '1395290762412818432', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1400751938689040384, 'm17792184721', '2023-03-31 00:00:00', null, null, null, 'm17792184721', '1400361287958921216', '1400751938689040384', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1403929516804681729, 'admin1', '2023-03-31 00:00:00', null, null, null, 'admin1', '1403928259801133058', '1403929516804681729', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1407544184974721026, 'test1', '2023-03-31 00:00:00', null, null, null, 'test1', '1407537451145478146', '1407544184974721026', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1407570137180389378, 'test', '2023-03-31 00:00:00', null, null, null, 'test', '1399288118133129216', '1407570137180389378', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1409325908893179906, 'adam', '2023-03-31 00:00:00', null, null, null, 'adam', '1409322599235002370', '1409325908893179906', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1410080768856948738, 'd2a1515b97d95bb5fa6e0291513e4d03', '2023-03-31 00:00:00', null, null, null, 'd2a1515b97d95bb5fa6e0291513e4d03', '1409813591243440130', '1410080768856948738', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1410520556785434625, 'm19913885738', '2023-03-31 00:00:00', null, null, null, 'm19913885738', '1410506132255219714', '1410520556785434625', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1413008622955655170, 'm17780631385', '2023-03-31 00:00:00', null, null, null, 'm17780631385', '1412979561709527042', '1413008622955655170', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1413115175788474369, '梁英俊', '2023-03-31 00:00:00', null, null, null, '梁英俊', '1413114065296158722', '1413115175788474369', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1413749887712206849, 'admin', '2023-03-31 00:00:00', null, null, null, 'admin', '1412310886434213889', '1413749887712206849', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1414392847239847938, 'demo', '2023-03-31 00:00:00', null, null, null, 'demo', '1414392247731200002', '1414392847239847938', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1414587636824518657, 'demo111', '2023-03-31 00:00:00', null, null, null, 'demo111', '1414587334998208514', '1414587636824518657', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1414784513457098753, 'XYP', '2023-03-31 00:00:00', null, null, null, 'XYP', '1414783233061916673', '1414784513457098753', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1415571739086524418, 'hh', '2023-03-31 00:00:00', null, null, null, 'hh', '1415570220916248577', '1415571739086524418', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1417411608863641602, 'xwp', '2023-03-31 00:00:00', null, null, null, 'xwp', '1417410661773021185', '1417411608863641602', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1419829515207864322, '陈潜根', '2023-03-31 00:00:00', null, null, null, '陈潜根', '1419828080076419073', '1419829515207864322', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1420677813745532930, '4ff767d72c37521b3e543b581bd0ba15', '2023-03-31 00:00:00', null, null, null, '4ff767d72c37521b3e543b581bd0ba15', '1410872293467709442', '1420677813745532930', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1425437136798117889, 'abcc', '2023-03-31 00:00:00', null, null, null, 'abcc', '1425433055413170178', '1425437136798117889', null, null, true, true, true);
INSERT INTO li_clerk (id, create_by, create_time, delete_flag, update_by, update_time, clerk_name, member_id, store_id, department_id, role_ids, shopkeeper, is_super, status) VALUES (1425450340110594049, 'acc', '2023-03-31 00:00:00', null, null, null, 'acc', '1425450071696109569', '1425450340110594049', null, null, true, true, true);
COMMIT;

-- ----------------------------
-- Table structure for li_clerk_role
-- ----------------------------
DROP TABLE IF EXISTS `li_clerk_role`;

CREATE TABLE `li_clerk_role` (
  `id` bigint NOT NULL COMMENT 'ID',
  `clerk_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店员唯一id',
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色唯一id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic COMMENT = '店员角色表';

-- ----------------------------
-- Records of li_clerk_role
-- ----------------------------
-- ----------------------------
-- Table structure for li_store_department
-- ----------------------------
DROP TABLE IF EXISTS `li_store_department`;

CREATE TABLE `li_store_department` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门名称',
  `store_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店铺id',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '父id',
  `sort_order` decimal(20, 2) NULL DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic COMMENT = '店铺部门表';

-- ----------------------------
-- Records of li_store_department
-- ----------------------------
INSERT INTO
  `li_store_department`
VALUES
  (
    1481270034427785217,
    '15810610731',
    '2022-01-12 22:21:11.000000',
    0,
    '15810610731',
    '2022-01-13 22:59:41.714000',
    '一级部门1',
    '1376369067769724928',
    '0',
    1.00
  );

INSERT INTO
  `li_store_department`
VALUES
  (
    1481270392235470850,
    '15810610731',
    '2022-01-12 22:22:36.000000',
    0,
    '15810610731',
    '2022-02-10 19:54:03.594000',
    '一级部门2',
    '1376369067769724928',
    '0',
    0.10
  );

INSERT INTO
  `li_store_department`
VALUES
  (
    1481272288283176962,
    '15810610731',
    '2022-01-12 22:30:08.893000',
    0,
    NULL,
    NULL,
    '二级部门1',
    '1376369067769724928',
    '1481270034427785217',
    0.00
  );

INSERT INTO
  `li_store_department`
VALUES
  (
    1481272362006458370,
    '15810610731',
    '2022-01-12 22:30:26.000000',
    0,
    '15810610731',
    '2022-02-10 19:54:13.671000',
    '二级部门2',
    '1376369067769724928',
    '1481270034427785217',
    1.00
  );

-- ----------------------------
-- Table structure for li_store_department_role
-- ----------------------------
DROP TABLE IF EXISTS `li_store_department_role`;

CREATE TABLE `li_store_department_role` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色id',
  `department_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic COMMENT = '部门角色表';

-- ----------------------------
-- Records of li_store_department_role
-- ----------------------------
INSERT INTO
  `li_store_department_role`
VALUES
  (
    1481642111785648130,
    '15810610731',
    '2022-01-13 22:59:41.687000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1481270034427785217'
  );

INSERT INTO
  `li_store_department_role`
VALUES
  (
    1491742255382224898,
    '15810610731',
    '2022-02-10 19:54:03.571000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1481270392235470850'
  );

INSERT INTO
  `li_store_department_role`
VALUES
  (
    1491742297740500994,
    '15810610731',
    '2022-02-10 19:54:13.671000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1481272362006458370'
  );

-- ----------------------------
-- Table structure for li_store_menu
-- ----------------------------
DROP TABLE IF EXISTS `li_store_menu`;

CREATE TABLE `li_store_menu` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '说明备注',
  `front_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '前端路由',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `level` int DEFAULT NULL COMMENT '层级',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单/权限名称',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '赋权API地址,正则表达式',
  `sort_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '排序值',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '菜单表';

-- ----------------------------
-- Records of li_store_menu
-- ----------------------------
BEGIN;

INSERT INTO
  `li_store_menu`
VALUES
  (
    1348810750596767744,
    NULL,
    '2022-01-11 22:35:33.000000',
    0,
    NULL,
    '2022-01-11 22:36:52',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'goods',
    '0',
    '/',
    '1',
    '商品',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1348810864748945408,
    NULL,
    '2022-01-11 22:35:37.000000',
    0,
    NULL,
    '2022-01-11 22:36:55',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1348810750596767744',
    '/',
    '1.1',
    '商品管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349237129847005184,
    NULL,
    '2022-01-11 22:35:40.000000',
    0,
    NULL,
    '2022-01-11 22:36:59',
    NULL,
    'goods-operation',
    'ios-american-football',
    2,
    'goods-operation',
    '1348810864748945408',
    '/goods-operation',
    '1.11',
    '商品发布',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349237207378714624,
    NULL,
    '2022-01-11 22:35:42.000000',
    0,
    NULL,
    '2022-01-11 22:37:02',
    NULL,
    'goods/goods-seller/goods',
    'ios-american-football',
    2,
    'goods',
    '1348810864748945408',
    'goods',
    '1.12',
    '商品列表',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349237928434098176,
    NULL,
    '2022-01-11 22:35:45.000000',
    0,
    NULL,
    '2022-01-11 22:37:05',
    NULL,
    'goods/goods-seller/draftGoods',
    'ios-american-football',
    2,
    'template-goods',
    '1348810864748945408',
    'template-goods',
    '1.13',
    '商品模板',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349246048900243456,
    NULL,
    '2022-01-11 22:35:48.000000',
    0,
    NULL,
    '2022-01-11 22:37:08',
    NULL,
    'goods/goods-manage/category',
    'ios-american-football',
    2,
    'category',
    '1348810864748945408',
    'category',
    '1.14',
    '店铺分类',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349246347597602816,
    NULL,
    '2022-01-11 22:35:51.000000',
    0,
    NULL,
    '2022-01-11 22:37:11',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'order',
    '0',
    '/',
    '2',
    '订单',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349246468775239680,
    NULL,
    '2022-01-11 22:38:28.000000',
    0,
    NULL,
    '2022-01-11 22:38:31',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1349246347597602816',
    '/',
    '2.1',
    '订单管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349246671158796288,
    NULL,
    '2022-01-11 22:38:42.000000',
    0,
    NULL,
    '2022-01-11 22:38:35',
    NULL,
    'order/order/orderList',
    'ios-american-football',
    2,
    'orderList',
    '1349246468775239680',
    'orderList',
    '2.11',
    '商品订单',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349246896661356544,
    NULL,
    '2022-01-11 22:40:27.000000',
    0,
    NULL,
    '2022-01-11 22:40:34',
    NULL,
    'order/order/virtualOrderList',
    'ios-american-football',
    2,
    'virtualOrderList',
    '1349246468775239680',
    'virtualOrderList',
    '2.12',
    '虚拟订单',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349247081504333824,
    NULL,
    '2022-01-11 22:41:47.000000',
    0,
    NULL,
    '2022-01-11 22:41:50',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1349246347597602816',
    '/',
    '2.2',
    '评价管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349247640584085504,
    NULL,
    '2022-01-11 22:43:29.000000',
    0,
    NULL,
    '2022-01-11 22:45:47',
    NULL,
    'member/memberComment',
    'ios-american-football',
    2,
    'memberComment',
    '1349247081504333824',
    'memberComment',
    '2.21',
    '评价管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349254815809298432,
    NULL,
    '2022-01-11 22:45:35.000000',
    0,
    NULL,
    '2022-01-11 22:45:50',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1349246347597602816',
    '/',
    '2.3',
    '售后管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349255214977015808,
    NULL,
    '2022-01-11 22:49:22.000000',
    0,
    NULL,
    '2022-01-11 22:49:27',
    NULL,
    'order/after-order/returnGoodsOrder',
    'ios-american-football',
    2,
    'returnGoodsOrder',
    '1349254815809298432',
    'returnGoodsOrder',
    '2.31',
    '退货管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349255404425338880,
    NULL,
    '2022-01-11 22:51:20.000000',
    0,
    NULL,
    '2022-01-11 22:51:22',
    NULL,
    'order/after-order/returnMoneyOrder',
    'ios-american-football',
    2,
    'returnMoneyOrder',
    '1349254815809298432',
    'returnMoneyOrder',
    '2.32',
    '退款管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1349256082979840000,
    NULL,
    '2022-01-11 22:52:50.000000',
    0,
    NULL,
    '2022-01-11 22:52:55',
    NULL,
    'order/after-order/orderComplaint',
    'ios-american-football',
    2,
    'orderComplaint',
    '1349254815809298432',
    'orderComplaint',
    '2.33',
    '投诉管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1357584224760102912,
    NULL,
    '2022-01-11 23:02:20.000000',
    0,
    NULL,
    '2022-01-11 23:02:25',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'bill',
    '0',
    '/',
    '3',
    '财务',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1357873097859923969,
    NULL,
    '2022-01-11 23:04:13.000000',
    0,
    NULL,
    '2022-01-11 23:04:17',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1357584224760102912',
    '/',
    '3.1',
    '财务管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367038467288072192,
    NULL,
    '2022-01-11 23:06:11.000000',
    0,
    NULL,
    '2022-01-11 23:06:16',
    NULL,
    'shop/bill/accountStatementBill',
    'ios-american-football',
    2,
    'accountStatementBill',
    '1357873097859923969',
    'accountStatementBill',
    '3.11',
    '财务对账',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367039534616805376,
    NULL,
    '2022-01-11 23:07:54.000000',
    0,
    NULL,
    '2022-01-11 23:07:57',
    NULL,
    'shop/bill/storeBill',
    'ios-american-football',
    2,
    'storeBill',
    '1357873097859923969',
    'storeBill',
    '3.12',
    '店铺结算',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367039950368800768,
    NULL,
    '2022-01-11 23:09:26.000000',
    0,
    NULL,
    '2022-01-11 23:09:29',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1357584224760102912',
    '/',
    '3.2',
    '发票管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367040067201138688,
    NULL,
    '2022-01-11 23:11:14.000000',
    0,
    NULL,
    '2022-01-11 23:11:18',
    NULL,
    'order/receiptManager/receipt',
    'ios-american-football',
    2,
    'receipt',
    '1367039950368800768',
    'receipt',
    '3.21',
    '发票管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367040599596728320,
    NULL,
    '2022-01-11 23:12:49.000000',
    0,
    NULL,
    '2022-01-11 23:12:52',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'promotion',
    '0',
    '/',
    '4',
    '营销',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367040819248234496,
    NULL,
    '2022-01-11 23:14:35.000000',
    0,
    NULL,
    '2022-01-11 23:14:38',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367040599596728320',
    '/',
    '4.1',
    '平台活动',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367041332861730816,
    NULL,
    '2022-01-11 23:15:42.000000',
    0,
    NULL,
    '2022-01-11 23:15:48',
    NULL,
    'promotion/pintuan/pintuan',
    'ios-american-football',
    2,
    'pintuan',
    '1367040819248234496',
    'pintuan',
    '4.11',
    '拼团活动',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367041461194850304,
    NULL,
    '2022-01-11 23:17:32.000000',
    0,
    NULL,
    '2022-01-11 23:17:44',
    NULL,
    'promotion/seckill/seckill',
    'ios-american-football',
    2,
    'seckill',
    '1367040819248234496',
    'seckill',
    '4.12',
    '秒杀活动',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367041575619657728,
    NULL,
    '2022-01-11 23:20:19.000000',
    0,
    NULL,
    '2022-01-11 23:20:24',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367040599596728320',
    '/',
    '4.2',
    '直播活动',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367042490443497472,
    NULL,
    '2022-01-11 23:21:13.000000',
    0,
    NULL,
    '2022-01-11 23:21:22',
    NULL,
    'promotion/live/live',
    'ios-american-football',
    2,
    'live',
    '1367041575619657728',
    'live',
    '4.21',
    '直播管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367042664410644480,
    NULL,
    '2022-01-11 23:22:42.000000',
    0,
    NULL,
    '2022-01-11 23:22:59',
    NULL,
    'promotion/live/liveGoods',
    'ios-american-football',
    2,
    'liveGoods',
    '1367041575619657728',
    'liveGoods',
    '4.22',
    '直播商品',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367042804944994304,
    NULL,
    '2022-01-11 23:24:24.000000',
    0,
    NULL,
    '2022-01-11 23:24:38',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367040599596728320',
    '/',
    '4.3',
    '商家活动',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367042804944994305,
    NULL,
    '2022-01-11 23:24:29.000000',
    0,
    NULL,
    '2022-01-11 23:24:42',
    NULL,
    'promotion/full-discount/full-discount',
    'ios-american-football',
    2,
    'full-cut',
    '1367042804944994304',
    'full-discount',
    '4.31',
    '满额活动',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367042917113266176,
    NULL,
    '2022-01-11 23:26:45.000000',
    0,
    NULL,
    '2022-01-11 23:26:50',
    NULL,
    'promotion/coupon/coupon',
    'ios-american-football',
    2,
    'coupon',
    '1367042804944994304',
    'coupon',
    '4.32',
    '优惠券',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367043020976816128,
    NULL,
    '2022-01-11 23:28:50.000000',
    0,
    NULL,
    '2022-01-11 23:29:02',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367040599596728320',
    '/',
    '4.4',
    '分销管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367043443917848576,
    NULL,
    '2022-01-11 23:28:53.000000',
    0,
    NULL,
    '2022-01-11 23:29:04',
    NULL,
    'distribution/distributionGoods',
    'ios-american-football',
    2,
    'distributionGoods',
    '1367043020976816128',
    'distributionGoods',
    '4.41',
    '分销商品',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367043505771249664,
    NULL,
    '2022-01-11 23:28:56.000000',
    0,
    NULL,
    '2022-01-11 23:29:07',
    NULL,
    'distribution/distributionOrder',
    'ios-american-football',
    2,
    'distributionOrder',
    '1367043020976816128',
    'distributionOrderdistributionOrder',
    '4.42',
    '分销订单',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367044121163726848,
    NULL,
    '2022-01-12 21:47:03.000000',
    0,
    NULL,
    '2022-01-12 21:47:25',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'statistics',
    '0',
    '/',
    '5',
    '统计',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367044247978508288,
    NULL,
    '2022-01-12 21:47:19.000000',
    0,
    NULL,
    '2022-01-12 21:47:28',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367044121163726848',
    '/',
    '5.1',
    '统计管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367044376391319552,
    NULL,
    '2022-01-12 21:49:45.000000',
    0,
    NULL,
    '2022-01-12 21:50:01',
    NULL,
    'statistics/goods',
    'ios-american-football',
    2,
    'goodsStatistics',
    '1367044247978508288',
    'goodsStatistics',
    '5.11',
    '商品统计',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367044657296441344,
    NULL,
    '2022-01-12 21:49:48.000000',
    0,
    NULL,
    '2022-01-12 21:49:58',
    NULL,
    'statistics/order',
    'ios-american-football',
    2,
    'orderStatistics',
    '1367044247978508288',
    'orderStatistics',
    '5.12',
    '订单统计',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367045529720061952,
    NULL,
    '2022-01-12 21:49:51.000000',
    0,
    NULL,
    '2022-01-12 21:50:03',
    NULL,
    'statistics/traffic',
    'ios-american-football',
    2,
    'trafficStatistics',
    '1367044247978508288',
    'trafficStatistics',
    '5.13',
    '流量统计',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367045630710513664,
    NULL,
    '2022-01-12 21:52:59.000000',
    0,
    NULL,
    '2022-01-12 21:53:09',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'settings',
    '0',
    '/',
    '6',
    '设置',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367045794284175360,
    NULL,
    '2022-01-12 21:53:03.000000',
    0,
    NULL,
    '2022-01-12 21:53:12',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367045630710513664',
    '/',
    '6.1',
    '配送设置',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367045921434501120,
    NULL,
    '2022-01-12 21:55:49.000000',
    0,
    NULL,
    '2022-01-12 21:55:52',
    NULL,
    'shop/ship/shipTemplate',
    'ios-american-football',
    2,
    'shipTemplate',
    '1367045794284175360',
    'shipTemplate',
    '6.11',
    '配送模板',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367046068369358848,
    NULL,
    '2022-01-12 21:58:05.000000',
    0,
    NULL,
    '2022-01-12 21:58:13',
    NULL,
    'shop/ship/logistics',
    'ios-american-football',
    2,
    'logistics',
    '1367045794284175360',
    'logistics',
    '6.12',
    '物流公司',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367046266214678528,
    NULL,
    '2022-01-12 21:59:07.000000',
    0,
    NULL,
    '2022-01-12 21:59:43',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367045630710513664',
    '/',
    '6.2',
    '店铺管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048084701315072,
    NULL,
    '2022-01-12 21:59:32.000000',
    0,
    NULL,
    '2022-01-12 21:59:48',
    NULL,
    'shop/shopSetting',
    'ios-american-football',
    2,
    'shopSetting',
    '1367046266214678528',
    'shopSetting',
    '6.21',
    '店铺设置',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048684339986432,
    NULL,
    '2022-01-12 21:59:36.000000',
    0,
    NULL,
    '2022-01-12 21:59:51',
    NULL,
    'shop/shopAddress',
    'ios-american-football',
    2,
    'shopAddress',
    '1367046266214678528',
    'shopAddress',
    '6.22',
    '自提管理',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048754229673984,
    NULL,
    '2022-01-12 22:02:11.000000',
    0,
    NULL,
    '2022-01-12 22:04:36',
    NULL,
    'Main',
    'ios-american-football',
    0,
    'Main',
    '0',
    '/',
    '7',
    '消息',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048832210173952,
    NULL,
    '2022-01-12 22:02:49.000000',
    0,
    NULL,
    '2022-01-12 22:04:39',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367048754229673984',
    '/',
    '7.1',
    '系统消息',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861503,
    NULL,
    '2022-02-18 16:08:30.000000',
    0,
    NULL,
    '2022-02-18 16:08:36',
    NULL,
    'Main',
    'ios-american-football',
    1,
    'Main',
    '1367045630710513664',
    '/',
    '6.3',
    '店员设置',
    ''
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861504,
    NULL,
    '2022-01-12 22:02:51.000000',
    0,
    NULL,
    '2022-01-12 22:04:45',
    NULL,
    'message',
    'ios-american-football',
    2,
    'message_index',
    '1367048832210173952',
    'message',
    '7.11',
    '系统消息',
    NULL
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861505,
    NULL,
    '2022-02-18 16:12:18.000000',
    0,
    NULL,
    '2022-02-18 16:12:21',
    NULL,
    'shop/system/clerk/clerkManage',
    'ios-american-football',
    2,
    'clerkManage',
    '1367048967635861503',
    'clerkManage',
    '6.31',
    '店员管理',
    '/store/department*,/store/clerk*,/store/role*,/store/department*'
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861506,
    NULL,
    '2022-02-18 16:25:27.000000',
    0,
    NULL,
    '2022-02-18 16:25:31',
    NULL,
    'shop/system/department/storeDepartmentManage',
    'ios-american-football',
    2,
    'storeDepartmentManage',
    '1367048967635861503',
    'storeDepartmentManage',
    '6.32',
    '部门管理',
    '/store/department*'
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861507,
    NULL,
    '2022-02-18 16:27:28.000000',
    0,
    NULL,
    '2022-02-18 16:27:30',
    NULL,
    'shop/system/role/storeRoleManage',
    'ios-american-football',
    2,
    'storeRoleManage',
    '1367048967635861503',
    'storeRoleManage',
    '6.33',
    '角色权限',
    '/store/role*'
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861508,
    NULL,
    '2022-02-18 16:27:28.000000',
    0,
    NULL,
    '2022-02-18 16:27:30',
    NULL,
    'shop/floorList',
    'ios-american-football',
    2,
    'pcList',
    '1367046266214678528',
    'pcList',
    '10',
    'PC装修',
    '/store/other/pageData*'
  );

INSERT INTO
  `li_store_menu`
VALUES
  (
    1367048967635861509,
    NULL,
    '2022-08-26 11:46:14.000000',
    NULL,
    NULL,
    '2022-08-26 11:46:16',
    NULL,
    'shop/wap/wapList',
    'ios-american-football',
    2,
    'wapList',
    '1367046266214678528',
    'wapList',
    '9',
    '移动楼层',
    '/store/other/pageData*'
  );

COMMIT;

-- ----------------------------
-- Table structure for li_store_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `li_store_menu_role`;

CREATE TABLE `li_store_menu_role` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单',
  `store_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店铺id',
  `is_super` bit(1) NULL DEFAULT NULL COMMENT '是否拥有操作数据权限，为否则只有查看权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic COMMENT = '菜单角色关联表';

-- ----------------------------
-- Records of li_store_menu_role
-- ----------------------------
INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117223391234,
    '15810610731',
    '2022-02-10 20:25:17.980000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349246347597602816',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117227585538,
    '15810610731',
    '2022-02-10 20:25:17.981000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349246468775239680',
    '1376369067769724928',
    0
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117235974145,
    '15810610731',
    '2022-02-10 20:25:17.982000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349246671158796288',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117240168449,
    '15810610731',
    '2022-02-10 20:25:17.984000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349246896661356544',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117244362754,
    '15810610731',
    '2022-02-10 20:25:17.985000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349247081504333824',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117248557057,
    '15810610731',
    '2022-02-10 20:25:17.986000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349247640584085504',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117252751362,
    '15810610731',
    '2022-02-10 20:25:17.987000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349254815809298432',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117256945665,
    '15810610731',
    '2022-02-10 20:25:17.988000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349255214977015808',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117261139970,
    '15810610731',
    '2022-02-10 20:25:17.989000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349255404425338880',
    '1376369067769724928',
    1
  );

INSERT INTO
  `li_store_menu_role`
VALUES
  (
    1491750117265334274,
    '15810610731',
    '2022-02-10 20:25:17.990000',
    0,
    NULL,
    NULL,
    '1481639692985126913',
    '1349256082979840000',
    '1376369067769724928',
    1
  );

-- ----------------------------
-- Table structure for li_store_role
-- ----------------------------
DROP TABLE IF EXISTS `li_store_role`;

CREATE TABLE `li_store_role` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色名称',
  `store_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店铺id',
  `default_role` bit(1) NULL DEFAULT NULL COMMENT '是否为注册默认角色',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic COMMENT = '角色表';

-- ----------------------------
-- Records of li_store_role
-- ----------------------------
INSERT INTO
  `li_store_role`
VALUES
  (
    1481639692985126913,
    '15810610731',
    '2022-01-13 22:50:05.000000',
    0,
    '15810610731',
    '2022-01-13 23:01:50.177000',
    '财务',
    '1376369067769724928',
    0,
    '1'
  );

SET
  FOREIGN_KEY_CHECKS = 1;