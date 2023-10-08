drop database if exists lilishop_distribution;

create database lilishop_distribution CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_distribution;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_distribution
-- ----------------------------
DROP TABLE IF EXISTS `li_distribution`;

CREATE TABLE `li_distribution` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `can_rebate` double(20, 2) DEFAULT NULL COMMENT '可提现金额',
  `commission_frozen` double(20, 2) DEFAULT NULL COMMENT '冻结金额',
  `distribution_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分销商状态',
  `member_id` bigint DEFAULT NULL COMMENT '用户ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名称',
  `rebate_total` double(20, 2) DEFAULT NULL COMMENT '分销总额',
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身份证号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '姓名',
  `distribution_order_count` int DEFAULT NULL COMMENT '分销订单数',
  `settlement_bank_account_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `settlement_bank_account_num` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `settlement_bank_branch_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分销商表';

-- ----------------------------
-- Table structure for li_distribution_cash
-- ----------------------------
DROP TABLE IF EXISTS `li_distribution_cash`;

CREATE TABLE `li_distribution_cash` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `distribution_cash_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `distribution_id` bigint DEFAULT NULL COMMENT '分销员ID',
  `distribution_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分销员名称',
  `pay_time` datetime(6) DEFAULT NULL COMMENT '支付时间',
  `price` double(20, 2) DEFAULT NULL COMMENT '分销佣金',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分销佣金编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分销佣金表';

-- ----------------------------
-- Table structure for li_distribution_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_distribution_goods`;

CREATE TABLE `li_distribution_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `commission` double NOT NULL COMMENT '佣金金额',
  `goods_id` bigint NOT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `price` double(20, 2) DEFAULT NULL COMMENT '商品价格',
  `quantity` int DEFAULT NULL COMMENT '库存',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `sku_id` bigint NOT NULL COMMENT '规格ID',
  `specs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '规格信息json',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图路径',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'storeName',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分销商品表';

-- ----------------------------
-- Table structure for li_distribution_order
-- ----------------------------
DROP TABLE IF EXISTS `li_distribution_order`;

CREATE TABLE `li_distribution_order` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `distribution_id` bigint DEFAULT NULL COMMENT '分销员ID',
  `distribution_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分销员名称',
  `distribution_order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分销订单状态',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `num` int DEFAULT NULL COMMENT '数量',
  `order_item_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单项编号',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `rebate` double DEFAULT NULL COMMENT '返利金额',
  `sell_back_rebate` double DEFAULT NULL COMMENT '退货返利金额',
  `settle_cycle` datetime(6) DEFAULT NULL COMMENT '结算周期',
  `sku_id` bigint DEFAULT NULL COMMENT '规格ID',
  `specs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '规格信息json',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id索引',
  KEY `order_sn` (`order_sn`) USING BTREE COMMENT ' 订单编号索引',
  KEY `distribution_id` (`distribution_id`) USING BTREE COMMENT '分销员索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分销订单表';

-- ----------------------------
-- Table structure for li_distribution_selected_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_distribution_selected_goods`;

CREATE TABLE `li_distribution_selected_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `distribution_goods_id` bigint DEFAULT NULL COMMENT '分销商品ID',
  `distribution_id` bigint DEFAULT NULL COMMENT '分销商ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `distribution_id` (`distribution_id`) USING BTREE COMMENT '分销员id'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分销员选择商品表';

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