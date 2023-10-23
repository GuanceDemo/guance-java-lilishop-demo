drop database if exists lilishop_promotion;

create database lilishop_promotion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_promotion;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_coupon
-- ----------------------------
DROP TABLE IF EXISTS `li_coupon`;

CREATE TABLE `li_coupon` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `consume_threshold` double(10, 2) DEFAULT NULL COMMENT '消费门槛',
  `coupon_discount` double(10, 2) DEFAULT NULL COMMENT '折扣',
  `coupon_limit_num` int DEFAULT NULL COMMENT '领取限制',
  `coupon_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '优惠券名称',
  `coupon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动描述',
  `get_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '优惠券类型',
  `price` double(10, 2) DEFAULT NULL COMMENT '面额',
  `publish_num` int DEFAULT NULL COMMENT '发行数量',
  `received_num` int DEFAULT NULL COMMENT '已被领取的数量',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `store_commission` double(10, 2) DEFAULT NULL COMMENT '店铺承担比例',
  `used_num` int DEFAULT NULL COMMENT '已被使用的数量',
  `range_day_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `effective_days` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '优惠券表';

-- ----------------------------
-- Records of li_coupon
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_coupon_activity
-- ----------------------------
DROP TABLE IF EXISTS `li_coupon_activity`;

CREATE TABLE `li_coupon_activity` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `activity_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '活动范围',
  `activity_scope_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动范围信息',
  `coupon_activity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '活动类型',
  coupon_frequency_enum varchar(255) COMMENT '领取周期',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '优惠券活动表';

-- ----------------------------
-- Records of li_coupon_activity
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_coupon_activity_item
-- ----------------------------
DROP TABLE IF EXISTS `li_coupon_activity_item`;

CREATE TABLE `li_coupon_activity_item` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `activity_id` bigint DEFAULT NULL COMMENT '活动ID',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券ID',
  `num` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '优惠券活动关联表';

-- ----------------------------
-- Records of li_coupon_activity_item
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_full_discount
-- ----------------------------
DROP TABLE IF EXISTS `li_full_discount`;

CREATE TABLE `li_full_discount` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券ID',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动说明',
  `full_minus` double(20, 2) DEFAULT NULL COMMENT '减现金',
  `full_money` double(20, 2) NOT NULL COMMENT '优惠门槛金额',
  `full_rate` double(20, 2) DEFAULT NULL COMMENT '打折',
  `gift_id` bigint DEFAULT NULL COMMENT '赠品ID',
  `coupon_flag` bit(1) DEFAULT NULL COMMENT '是否赠优惠券',
  `free_freight_flag` bit(1) DEFAULT NULL COMMENT '是否包邮',
  `full_minus_flag` bit(1) DEFAULT NULL COMMENT '活动是否减现金',
  `full_rate_flag` bit(1) DEFAULT NULL COMMENT '是否打折',
  `gift_flag` bit(1) DEFAULT NULL COMMENT '是否有赠品',
  `point_flag` bit(1) DEFAULT NULL COMMENT '是否赠送积分',
  `points` int DEFAULT NULL COMMENT '赠送多少积分',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动标题',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id模版'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '满减活动表';

-- ----------------------------
-- Records of li_full_discount
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_kanjia_activity
-- ----------------------------
DROP TABLE IF EXISTS `li_kanjia_activity`;

CREATE TABLE `li_kanjia_activity` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `kanjia_activity_goods_id` bigint DEFAULT NULL COMMENT '砍价活动商品ID',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `purchase_price` double DEFAULT NULL COMMENT '购买价格',
  `sku_id` bigint DEFAULT NULL COMMENT 'skuID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `surplus_price` double DEFAULT NULL COMMENT '剩余价格',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品缩略图',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '砍价活动表';

-- ----------------------------
-- Records of li_kanjia_activity
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_kanjia_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_kanjia_activity_goods`;

CREATE TABLE `li_kanjia_activity_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '范围类型',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `highest_price` double DEFAULT NULL COMMENT '最高价格',
  `lowest_price` double DEFAULT NULL COMMENT '最低价格',
  `original_price` double DEFAULT NULL COMMENT '原价',
  `purchase_price` double DEFAULT NULL COMMENT '购买价格',
  `settlement_price` double DEFAULT NULL COMMENT '结算价格',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `sku_id` bigint DEFAULT NULL COMMENT 'skuID',
  `stock` int DEFAULT NULL COMMENT '库存',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '砍价活动商品表';

-- ----------------------------
-- Records of li_kanjia_activity_goods
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_kanjia_activity_log
-- ----------------------------
DROP TABLE IF EXISTS `li_kanjia_activity_log`;

CREATE TABLE `li_kanjia_activity_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `kanjia_activity_id` bigint DEFAULT NULL COMMENT '砍价活动ID',
  `kanjia_member_face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '砍价会员头像',
  `kanjia_member_id` bigint DEFAULT NULL COMMENT '砍价会员ID',
  `kanjia_member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '砍价会员名称',
  `kanjia_price` double DEFAULT NULL COMMENT '砍价价格',
  `surplus_price` double DEFAULT NULL COMMENT '剩余价格',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '砍价活动日志表';

-- ----------------------------
-- Records of li_kanjia_activity_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `li_member_coupon`;

CREATE TABLE `li_member_coupon` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `consume_threshold` double(20, 2) DEFAULT NULL COMMENT '消费门槛',
  `consumption_time` datetime(6) DEFAULT NULL COMMENT '核销时间',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券ID',
  `coupon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动类型',
  `discount` double DEFAULT NULL COMMENT '折扣',
  `end_time` datetime(6) DEFAULT NULL COMMENT '使用截止时间',
  `get_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '优惠券类型',
  `platform_flag` bit(1) DEFAULT NULL COMMENT '是否是平台优惠券',
  `member_coupon_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员优惠券状态',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `price` double(20, 2) DEFAULT NULL COMMENT '面额',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `store_commission` double(20, 2) DEFAULT NULL COMMENT '店铺承担比例',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `start_time` datetime(6) DEFAULT NULL COMMENT '使用起始时间',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member-id` (`member_id`) COMMENT 'member_id检索优惠券索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '会员优惠券表';

-- ----------------------------
-- Records of li_member_coupon
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_pintuan
-- ----------------------------
DROP TABLE IF EXISTS `li_pintuan`;

CREATE TABLE `li_pintuan` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `fictitious` bit(1) DEFAULT NULL COMMENT '虚拟成团',
  `limit_num` int DEFAULT NULL COMMENT '限购数量',
  `pintuan_rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拼团规则',
  `required_num` int DEFAULT NULL COMMENT '成团人数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '拼团活动表';

-- ----------------------------
-- Records of li_pintuan
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_points_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_points_goods`;

CREATE TABLE `li_points_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `active_stock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动库存数量',
  `points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '兑换积分',
  `points_goods_category_id` bigint DEFAULT NULL COMMENT '积分商品分类编号',
  `points_goods_category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类名称',
  `original_price` double(10, 2) DEFAULT NULL COMMENT '原价',
  `settlement_price` double(10, 2) DEFAULT NULL COMMENT '结算价格',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图',
  `goods_id` bigint DEFAULT NULL COMMENT '商品编号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '货品名称',
  `sku_id` bigint DEFAULT NULL COMMENT '商品Sku编号',
  PRIMARY KEY (`id`),
  KEY `sku_id` (`sku_id`) USING BTREE COMMENT 'skuId 索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '积分商品表';

-- ----------------------------
-- Records of li_points_goods
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_points_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `li_points_goods_category`;

CREATE TABLE `li_points_goods_category` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `level` int DEFAULT NULL COMMENT '层级',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `sort_order` decimal(19, 2) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '积分商品分类表';

-- ----------------------------
-- Records of li_points_goods_category
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_promotion_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_promotion_goods`;

CREATE TABLE `li_promotion_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '货品名称',
  `limit_num` int DEFAULT NULL COMMENT '限购数量',
  `num` int DEFAULT NULL COMMENT '卖出的商品数量',
  `original_price` double(10, 2) DEFAULT NULL COMMENT '原价',
  `price` double(10, 2) DEFAULT NULL COMMENT '促销价格',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `promotion_id` bigint DEFAULT NULL COMMENT '活动ID',
  `quantity` int DEFAULT NULL COMMENT '促销库存',
  `points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '兑换积分',
  `promotion_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '促销工具类型',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `sku_id` bigint DEFAULT NULL COMMENT '货品SkuID',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动标题',
  `category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类路径',
  `goods_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '促销商品表';

-- ----------------------------
-- Records of li_promotion_goods
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_seckill
-- ----------------------------
DROP TABLE IF EXISTS `li_seckill`;

CREATE TABLE `li_seckill` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '活动结束时间',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动名称',
  `scope_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '范围关联的ID',
  `scope_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'PORTION_GOODS' COMMENT '关联范围类型',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `start_time` datetime(6) DEFAULT NULL COMMENT '活动开始时间',
  `apply_end_time` datetime(6) NOT NULL COMMENT '报名截至时间',
  `hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '开启几点场',
  `seckill_rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '申请规则',
  `store_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺ID集合以逗号分隔',
  `goods_num` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '秒杀活动表';

-- ----------------------------
-- Records of li_seckill
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_seckill_apply
-- ----------------------------
DROP TABLE IF EXISTS `li_seckill_apply`;

CREATE TABLE `li_seckill_apply` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `fail_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '驳回原因',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `original_price` double(10, 2) DEFAULT NULL COMMENT '商品原始价格',
  `price` double(10, 2) NOT NULL COMMENT '价格',
  `promotion_apply_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '促销活动申请状态',
  `quantity` int NOT NULL COMMENT '促销数量',
  `sales_num` int DEFAULT NULL COMMENT '已售数量',
  `seckill_id` bigint NOT NULL COMMENT '活动ID',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `sku_id` bigint NOT NULL COMMENT '货品ID',
  `time_line` int NOT NULL COMMENT '时刻',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '秒杀活动申请表';

-- ----------------------------
-- Records of li_seckill_apply
-- ----------------------------
BEGIN;

COMMIT;

-- 会员优惠券标识
CREATE TABLE `li_member_coupon_sign` (
  `id` bigint NOT NULL,
  `coupon_activity_Id` bigint NULL DEFAULT NULL COMMENT '优惠券活动id',
  `member_id` bigint NULL DEFAULT NULL COMMENT '会员id',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '会员优惠券标识';


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

SET
  FOREIGN_KEY_CHECKS = 1;