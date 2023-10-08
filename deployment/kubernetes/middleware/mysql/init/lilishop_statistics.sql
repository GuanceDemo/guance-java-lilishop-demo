drop database if exists lilishop_statistics;

create database lilishop_statistics CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_statistics;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_member_statistics_data
-- ----------------------------
DROP TABLE IF EXISTS `li_member_statistics_data`;

CREATE TABLE `li_member_statistics_data` (
  `id` bigint NOT NULL COMMENT 'ID',
  `active_quantity` int DEFAULT NULL COMMENT '当日活跃数量',
  `create_date` datetime(6) DEFAULT NULL COMMENT '统计日',
  `member_count` int DEFAULT NULL COMMENT '当前会员数量',
  `newly_added` int DEFAULT NULL COMMENT '新增会员数量',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '会员统计表';

-- ----------------------------
-- Records of li_member_statistics_data
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_s_platform_view_data
-- ----------------------------
DROP TABLE IF EXISTS `li_s_platform_view_data`;

CREATE TABLE `li_s_platform_view_data` (
  `id` bigint NOT NULL COMMENT 'ID',
  `date` datetime(6) DEFAULT NULL COMMENT '统计日',
  `pv_num` bigint DEFAULT NULL COMMENT 'PV数量',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `uv_num` bigint DEFAULT NULL COMMENT 'UV数量',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '平台pv统计表';

-- ----------------------------
-- Records of li_s_platform_view_data
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COMMENT = '会员统计表';

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;

COMMIT;

SET
  FOREIGN_KEY_CHECKS = 1;