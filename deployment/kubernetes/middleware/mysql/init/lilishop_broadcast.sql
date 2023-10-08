drop database if exists lilishop_broadcast;

create database lilishop_broadcast CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_broadcast;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_commodity
-- ----------------------------
DROP TABLE IF EXISTS `li_commodity`;

CREATE TABLE `li_commodity` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `audit_id` bigint DEFAULT NULL COMMENT '审核人ID',
  `audit_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核状态',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `live_goods_id` int DEFAULT NULL COMMENT '直播商品ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `price` double DEFAULT NULL COMMENT '商品价格',
  `price2` double DEFAULT NULL COMMENT '商品价格2',
  `price_type` int DEFAULT NULL COMMENT '价格类型',
  `sku_id` bigint DEFAULT NULL COMMENT '商品skuID',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品链接',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '小程序直播商品表';

-- ----------------------------
-- Table structure for li_studio
-- ----------------------------
DROP TABLE IF EXISTS `li_studio`;

CREATE TABLE `li_studio` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `anchor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主播名称',
  `anchor_wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主播微信号',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '封面图',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结束时间',
  `feeds_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '动态图',
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '直播地址',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '直播名称',
  `qr_code_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '二维码地址',
  `recommend` bit(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `room_goods_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '直播商品列表',
  `room_goods_num` int DEFAULT '0' COMMENT '直播商品数量',
  `room_id` int DEFAULT NULL COMMENT '直播间ID',
  `share_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分享图',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '开始时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '直播状态',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '小程序直播间表';

-- ----------------------------
-- Table structure for li_studio_commodity
-- ----------------------------
DROP TABLE IF EXISTS `li_studio_commodity`;

CREATE TABLE `li_studio_commodity` (
  `id` bigint NOT NULL,
  `goods_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '直播间商品表';

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