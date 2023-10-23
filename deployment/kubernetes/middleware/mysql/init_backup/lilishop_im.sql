drop database if exists lilishop_im;

create database lilishop_im CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_im;

/**
 IM聊天
 */
CREATE TABLE `li_im_talk` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `user_id1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户1Id',
  `user_id2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户2Id',
  `name1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户1名称',
  `name2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户2名称',
  `face1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户1头像',
  `face2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户2头像',
  `top1` bit(1) DEFAULT NULL COMMENT '用户1置顶标识',
  `top2` bit(1) DEFAULT NULL COMMENT '用户2置顶标识',
  `disable1` bit(1) DEFAULT NULL COMMENT '用户1禁用标识',
  `disable2` bit(1) DEFAULT NULL COMMENT '用户2禁用标识',
  `store_flag1` bit(1) DEFAULT NULL COMMENT '用户1店铺标识',
  `store_flag2` bit(1) DEFAULT NULL COMMENT '用户2店铺标识',
  `last_talk_time` datetime DEFAULT NULL COMMENT '最后聊天时间',
  `last_talk_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '最后的消息',
  `last_message_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后消息类型',
  `talk_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '聊天Id',
  `tenant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '坐席Id',
  `tenant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '坐席名称',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'IM聊天';

/**
 IM消息
 */
CREATE TABLE `li_im_message` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标识',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '修改标识',
  `from_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送用户Id',
  `to_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接收用户Id',
  `is_read` bit(1) DEFAULT NULL COMMENT '已读标识',
  `message_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '聊天类型',
  `im_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '聊天内容',
  `talk_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '聊天Id',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'IM消息';