create database xxl_job CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use xxl_job;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;

CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;

INSERT INTO
  `xxl_job_group` (
    `id`,
    `app_name`,
    `title`,
    `address_type`,
    `address_list`,
    `update_time`
  )
VALUES
  (
    1,
    'xxl-job-executor-sample',
    '示例执行器',
    0,
    NULL,
    '2021-09-28 14:30:20'
  );

INSERT INTO
  `xxl_job_group` (
    `id`,
    `app_name`,
    `title`,
    `address_type`,
    `address_list`,
    `update_time`
  )
VALUES
  (
    2,
    'xxl-job-executor-lilishop',
    'lilishop',
    0,
    NULL,
    '2021-09-28 14:30:20'
  );

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;

CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;

INSERT INTO
  `xxl_job_info` (
    `id`,
    `job_group`,
    `job_desc`,
    `add_time`,
    `update_time`,
    `author`,
    `alarm_email`,
    `schedule_type`,
    `schedule_conf`,
    `misfire_strategy`,
    `executor_route_strategy`,
    `executor_handler`,
    `executor_param`,
    `executor_block_strategy`,
    `executor_timeout`,
    `executor_fail_retry_count`,
    `glue_type`,
    `glue_source`,
    `glue_remark`,
    `glue_updatetime`,
    `child_jobid`,
    `trigger_status`,
    `trigger_last_time`,
    `trigger_next_time`
  )
VALUES
  (
    1,
    1,
    '测试任务1',
    '2018-11-03 22:21:31',
    '2018-11-03 22:21:31',
    'XXL',
    NULL,
    'CRON',
    '0 0 0 * * ? *',
    'DO_NOTHING',
    'FIRST',
    'demoJobHandler',
    NULL,
    'SERIAL_EXECUTION',
    0,
    0,
    'BEAN',
    NULL,
    'GLUE代码初始化',
    '2018-11-03 22:21:31',
    NULL,
    0,
    0,
    0
  );

INSERT INTO
  `xxl_job_info` (
    `id`,
    `job_group`,
    `job_desc`,
    `add_time`,
    `update_time`,
    `author`,
    `alarm_email`,
    `schedule_type`,
    `schedule_conf`,
    `misfire_strategy`,
    `executor_route_strategy`,
    `executor_handler`,
    `executor_param`,
    `executor_block_strategy`,
    `executor_timeout`,
    `executor_fail_retry_count`,
    `glue_type`,
    `glue_source`,
    `glue_remark`,
    `glue_updatetime`,
    `child_jobid`,
    `trigger_status`,
    `trigger_last_time`,
    `trigger_next_time`
  )
VALUES
  (
    2,
    2,
    '每小时执行任务',
    '2020-12-24 11:01:24',
    '2020-12-24 15:03:03',
    'admin',
    NULL,
    'CRON',
    '0 0 0/1 * * ?',
    'DO_NOTHING',
    'ROUND',
    'everyHourExecuteJobHandler',
    NULL,
    'SERIAL_EXECUTION',
    0,
    0,
    'BEAN',
    NULL,
    'GLUE代码初始化',
    '2020-12-24 11:01:24',
    NULL,
    1,
    1632808800000,
    1632812400000
  );

INSERT INTO
  `xxl_job_info` (
    `id`,
    `job_group`,
    `job_desc`,
    `add_time`,
    `update_time`,
    `author`,
    `alarm_email`,
    `schedule_type`,
    `schedule_conf`,
    `misfire_strategy`,
    `executor_route_strategy`,
    `executor_handler`,
    `executor_param`,
    `executor_block_strategy`,
    `executor_timeout`,
    `executor_fail_retry_count`,
    `glue_type`,
    `glue_source`,
    `glue_remark`,
    `glue_updatetime`,
    `child_jobid`,
    `trigger_status`,
    `trigger_last_time`,
    `trigger_next_time`
  )
VALUES
  (
    3,
    2,
    '每分钟执行',
    '2020-12-24 11:02:58',
    '2020-12-24 15:02:49',
    'admin',
    NULL,
    'CRON',
    '0 0/1 * * * ?',
    'DO_NOTHING',
    'ROUND',
    'everyMinuteExecute',
    NULL,
    'SERIAL_EXECUTION',
    0,
    0,
    'BEAN',
    NULL,
    'GLUE代码初始化',
    '2020-12-24 11:02:58',
    NULL,
    1,
    1632810600000,
    1632810660000
  );

INSERT INTO
  `xxl_job_info` (
    `id`,
    `job_group`,
    `job_desc`,
    `add_time`,
    `update_time`,
    `author`,
    `alarm_email`,
    `schedule_type`,
    `schedule_conf`,
    `misfire_strategy`,
    `executor_route_strategy`,
    `executor_handler`,
    `executor_param`,
    `executor_block_strategy`,
    `executor_timeout`,
    `executor_fail_retry_count`,
    `glue_type`,
    `glue_source`,
    `glue_remark`,
    `glue_updatetime`,
    `child_jobid`,
    `trigger_status`,
    `trigger_last_time`,
    `trigger_next_time`
  )
VALUES
  (
    4,
    2,
    '每天执行',
    '2020-12-24 11:03:41',
    '2020-12-24 15:02:28',
    'admin',
    NULL,
    'CRON',
    '0 5 2 1/1 * ?',
    'DO_NOTHING',
    'ROUND',
    'everyDayExecuteJobHandler',
    NULL,
    'SERIAL_EXECUTION',
    0,
    0,
    'BEAN',
    NULL,
    'GLUE代码初始化',
    '2020-12-24 11:03:41',
    NULL,
    1,
    1632765900000,
    1632852300000
  );

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;

CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;

INSERT INTO
  `xxl_job_lock` (`lock_name`)
VALUES
  ('schedule_lock');

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;

CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE = InnoDB AUTO_INCREMENT = 14718 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;

CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;

CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;

CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`, `registry_key`, `registry_value`)
) ENGINE = InnoDB AUTO_INCREMENT = 1270 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;

CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;

INSERT INTO
  `xxl_job_user` (
    `id`,
    `username`,
    `password`,
    `role`,
    `permission`
  )
VALUES
  (
    1,
    'admin',
    '96e79218965eb72c92a549dd5a330112',
    1,
    NULL
  );

COMMIT;

SET
  FOREIGN_KEY_CHECKS = 1;