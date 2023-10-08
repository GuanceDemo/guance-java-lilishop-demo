drop database if exists lilishop_order;

create database lilishop_order CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_order;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `li_after_sale`;

CREATE TABLE `li_after_sale` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账号类型',
  `actual_refund_price` double(20, 2) DEFAULT NULL COMMENT '实际退款金额',
  `after_sale_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评价图片',
  `apply_refund_price` double(20, 2) DEFAULT NULL COMMENT '申请退款金额',
  `audit_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商家备注',
  `bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '银行账户',
  `bank_deposit_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '银行开户行',
  `flow_price` double DEFAULT NULL COMMENT '实际金额',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `m_deliver_time` datetime(6) DEFAULT NULL COMMENT '买家 发货时间',
  `m_logistics_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '买家 物流公司CODE',
  `m_logistics_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '买家 物流公司名称',
  `m_logistics_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '买家 发货单号',
  `member_id` bigint DEFAULT NULL COMMENT '用户ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名称',
  `num` int DEFAULT NULL COMMENT '申请数量',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `pay_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单支付方式返回的交易号',
  `problem_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '问题描述',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '申请原因',
  `refund_point` int DEFAULT NULL COMMENT '退还积分',
  `refund_time` datetime(6) DEFAULT NULL COMMENT '退款时间',
  `refund_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款方式',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `service_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后单状态',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后类型',
  `sku_id` bigint DEFAULT NULL COMMENT '货品ID',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后服务单号',
  `specs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '规格json',
  `trade_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易编号',
  `order_item_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单货物编号',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) COMMENT '会员id索引',
  KEY `store_id` (`store_id`) COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后服务表';

-- ----------------------------
-- Records of li_after_sale
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_after_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `li_after_sale_log`;

CREATE TABLE `li_after_sale_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `operator_id` bigint DEFAULT NULL COMMENT '操作者ID(可以是店铺)',
  `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者名称',
  `operator_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者类型',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后服务单号',
  PRIMARY KEY (`id`),
  KEY `sn` (`sn`) USING BTREE COMMENT '售后服务单号索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后服务日志表';

-- ----------------------------
-- Records of li_after_sale_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_after_sale_reason
-- ----------------------------
DROP TABLE IF EXISTS `li_after_sale_reason`;

CREATE TABLE `li_after_sale_reason` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后原因',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原因类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后原因表';

-- ----------------------------
-- Records of li_after_sale_reason
-- ----------------------------
BEGIN;

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357581861634703360,
    'admin',
    '2021-02-05 06:48:33.151000',
    0,
    NULL,
    NULL,
    '未收到货',
    'COMPLAIN'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357581919558041600,
    'admin',
    '2021-02-05 06:48:46.933000',
    0,
    NULL,
    NULL,
    '订单货物数量不对',
    'COMPLAIN'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357582072222318592,
    'admin',
    '2021-02-05 06:49:23.331000',
    0,
    NULL,
    NULL,
    '不按时发货',
    'RETURN_MONEY'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583466371219456,
    'admin',
    '2021-02-05 06:54:55.722000',
    0,
    NULL,
    NULL,
    '地址或商品选择错误',
    'RETURN_MONEY'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583504233201664,
    'admin',
    '2021-02-05 06:55:04.748000',
    0,
    NULL,
    NULL,
    '其他',
    'RETURN_MONEY'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583533337477120,
    'admin',
    '2021-02-05 06:55:11.688000',
    0,
    NULL,
    NULL,
    '商品选择错误',
    'CANCEL'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583555026223104,
    'admin',
    '2021-02-05 06:55:16.858000',
    0,
    NULL,
    NULL,
    '不想要了',
    'CANCEL'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583611645132800,
    'admin',
    '2021-02-05 06:55:30.357000',
    0,
    NULL,
    NULL,
    '不合适',
    'RETURN_GOODS'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583649075101696,
    'admin',
    '2021-02-05 06:55:39.282000',
    0,
    NULL,
    NULL,
    '不想要了',
    'RETURN_GOODS'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1357583690120560640,
    'admin',
    '2021-02-05 06:55:49.067000',
    0,
    NULL,
    NULL,
    '其他原因',
    'RETURN_GOODS'
  );

INSERT INTO
  `li_after_sale_reason` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `reason`,
    `service_type`
  )
VALUES
  (
    1416907707173408770,
    'admin',
    '2021-07-19 07:48:16.920000',
    0,
    NULL,
    NULL,
    '不想要了',
    'RETURN_GOODS'
  );

COMMIT;

-- ----------------------------
-- Table structure for li_order
-- ----------------------------
DROP TABLE IF EXISTS `li_order`;

CREATE TABLE `li_order` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `can_return` bit(1) DEFAULT NULL COMMENT '订单是否支持原路退回',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单取消原因',
  `client_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单来源',
  `complete_time` datetime(6) DEFAULT NULL COMMENT '完成时间',
  `consignee_address_id_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址id NULL,NULL分割',
  `consignee_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址名称  NULL,NULL分割"',
  `consignee_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址',
  `consignee_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收件人手机',
  `consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收件人姓名',
  `deliver_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '货运状态',
  `discount_price` double(10, 2) DEFAULT NULL COMMENT '优惠的金额',
  `flow_price` double(10, 2) DEFAULT NULL COMMENT '总价格',
  `freight_price` double(10, 2) DEFAULT NULL COMMENT '运费',
  `goods_num` int DEFAULT NULL COMMENT '商品数量',
  `goods_price` double(10, 2) DEFAULT NULL COMMENT '商品价格',
  `logistics_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '物流公司CODE',
  `logistics_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '物流公司名称',
  `logistics_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发货单号',
  `logistics_time` datetime(6) DEFAULT NULL COMMENT '送货时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `need_receipt` bit(1) DEFAULT NULL COMMENT '是否需要发票',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单状态',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单类型',
  `parent_order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否为其他订单下的订单，如果是则为依赖订单的sn，否则为空',
  `pay_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付方式返回的交易号',
  `pay_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '付款状态',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付方式',
  `payment_time` datetime(6) DEFAULT NULL COMMENT '支付时间',
  `price_detail` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '价格详情',
  `promotion_id` bigint DEFAULT NULL COMMENT '是否为某订单类型的订单，如果是则为订单类型的id，否则为空',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '买家订单备注',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `trade_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易编号 关联Trade',
  `weight` double(10, 2) DEFAULT NULL COMMENT '订单商品总重量',
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提货码',
  `update_price` double(10, 2) DEFAULT NULL COMMENT '修改价格',
  `distribution_id` bigint DEFAULT NULL COMMENT '分销员ID',
  `delivery_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配送方式',
  `use_platform_member_coupon_id` bigint DEFAULT NULL COMMENT '使用的平台会员优惠券id',
  `use_store_member_coupon_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '使用的店铺会员优惠券id(,区分)',
  `receivable_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order_promotion_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `verification_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `store_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `store_address_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `store_address_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gift_point` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '赠送积分',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_sn` (`sn`) USING BTREE COMMENT '订单编号索引',
  KEY `member_id` (`member_id`) COMMENT '会员id索引',
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单表';

-- ----------------------------
-- Records of li_order
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_order_complaint
-- ----------------------------
DROP TABLE IF EXISTS `li_order_complaint`;

CREATE TABLE `li_order_complaint` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `appeal_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '申诉商家内容',
  `appeal_images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '申诉商家上传的图片',
  `appeal_time` datetime DEFAULT NULL COMMENT '申诉商家时间',
  `arbitration_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '仲裁结果',
  `complain_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易投诉状态',
  `complain_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '投诉主题',
  `consignee_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货地址',
  `consignee_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人手机',
  `consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '投诉内容',
  `freight_price` double(20, 2) DEFAULT NULL COMMENT '运费',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `goods_price` double(20, 2) DEFAULT NULL COMMENT '商品价格',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '投诉凭证图片',
  `logistics_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '物流单号',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `num` int DEFAULT NULL COMMENT '购买的商品数量',
  `order_price` double(20, 2) DEFAULT NULL COMMENT '订单金额',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `sku_id` bigint DEFAULT NULL COMMENT '货品ID',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id索引',
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单投诉表';

-- ----------------------------
-- Records of li_order_complaint
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_order_complaint_communication
-- ----------------------------
DROP TABLE IF EXISTS `li_order_complaint_communication`;

CREATE TABLE `li_order_complaint_communication` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `complain_id` bigint DEFAULT NULL COMMENT '投诉ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '对话内容',
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属，买家/卖家',
  `owner_id` bigint DEFAULT NULL COMMENT '对话所属ID,卖家ID/买家ID',
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '对话所属名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单投诉对话表';

-- ----------------------------
-- Records of li_order_complaint_communication
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_order_item
-- ----------------------------
DROP TABLE IF EXISTS `li_order_item`;

CREATE TABLE `li_order_item` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `after_sale_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后状态',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `comment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评论状态',
  `complain_id` bigint DEFAULT NULL COMMENT '交易投诉ID',
  `complain_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '投诉状态',
  `flow_price` double(10, 2) DEFAULT NULL COMMENT '实际金额',
  `goods_price` double(10, 2) DEFAULT NULL COMMENT '销售金额',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `num` int DEFAULT NULL COMMENT '销售量',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `price_detail` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '价格详情',
  `promotion_id` bigint DEFAULT NULL COMMENT '促销ID',
  `promotion_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '促销类型',
  `sku_id` bigint DEFAULT NULL COMMENT '货品ID',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子订单编号',
  `snapshot_id` bigint DEFAULT NULL COMMENT '快照ID',
  `specs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '规格json',
  `trade_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易编号',
  `price_fluctuation_ratio` double(10, 2) DEFAULT NULL COMMENT '浮动价格比例',
  `unit_price` double(10, 2) DEFAULT NULL COMMENT '单价',
  `sub_total` double(20, 2) DEFAULT NULL COMMENT '小记',
  `return_goods_number` int DEFAULT '0' COMMENT '退货数量 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE COMMENT '订单编号索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单子表';

-- ----------------------------
-- Records of li_order_item
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_order_log
-- ----------------------------
DROP TABLE IF EXISTS `li_order_log`;

CREATE TABLE `li_order_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `operator_id` bigint DEFAULT NULL COMMENT '操作者ID',
  `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者名称',
  `operator_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者类型',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE COMMENT '订单编号 索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单日志表';

-- ----------------------------
-- Records of li_order_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_receipt
-- ----------------------------
DROP TABLE IF EXISTS `li_receipt`;

CREATE TABLE `li_receipt` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `receipt_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票内容',
  `receipt_detail` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '发票详情',
  `receipt_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票金额',
  `receipt_status` int DEFAULT NULL COMMENT '发票状态',
  `receipt_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票抬头',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `taxpayer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '纳税人识别号',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单发票表';

-- ----------------------------
-- Records of li_receipt
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `li_refund_log`;

CREATE TABLE `li_refund_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `after_sale_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退单编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `error_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款失败原因',
  `is_refund` bit(1) DEFAULT NULL COMMENT '是否已退款',
  `pay_price` double(10, 2) DEFAULT NULL COMMENT '交易支付金额',
  `payment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款方式',
  `payment_out_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付第三方申请流水号',
  `payment_receivable_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付第三方返回流水',
  `receivable_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方返回退款流水号',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款理由',
  `total_amount` double(10, 2) DEFAULT NULL COMMENT '金额',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单编号',
  `out_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '退款申请号码',
  `refund_status` text DEFAULT NULL COMMENT '退款状态',
  `sub_mchid` text DEFAULT NULL COMMENT '子商户号',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '退款日志表';

-- ----------------------------
-- Records of li_refund_log
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_store_flow
-- ----------------------------
DROP TABLE IF EXISTS `li_store_flow`;

CREATE TABLE `li_store_flow` (
  `id` bigint NOT NULL COMMENT 'ID',
  `bill_price` double DEFAULT NULL COMMENT '最终结算金额',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `commission_price` double(10, 2) DEFAULT NULL COMMENT '平台收取交易佣金',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `distribution_rebate` double(10, 2) DEFAULT NULL COMMENT '单品分销返现支出',
  `final_price` double(10, 2) DEFAULT NULL COMMENT '流水金额',
  `flow_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流水类型',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片',
  `member_id` bigint DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '会员名称',
  `num` int DEFAULT NULL COMMENT '销售量',
  `order_item_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子订单编号',
  `payment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付方式名称',
  `refund_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '售后SN',
  `site_coupon_commission` double(10, 2) DEFAULT NULL COMMENT '站点优惠券佣金',
  `site_coupon_point` double(10, 2) DEFAULT NULL COMMENT '站点优惠券佣金比例',
  `site_coupon_price` double(10, 2) DEFAULT NULL COMMENT '平台优惠券使用金额',
  `sku_id` bigint DEFAULT NULL COMMENT '货品ID',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编号',
  `specs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '规格',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方交易流水号',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `point_settlement_price` double DEFAULT '0' COMMENT '积分商品结算金额',
  `kanjia_settlement_price` double DEFAULT '0' COMMENT '砍价商品结算金额',
  `order_promotion_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gift_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '赠送积分',
  `profit_sharing` text DEFAULT NULL COMMENT '分账信息',
  `bill_time` datetime(6) DEFAULT NULL COMMENT '结算时间',
  `full_refund` bit(1) DEFAULT NULL COMMENT '是否全部退款，true为全部退款',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '店铺流水表';

-- ----------------------------
-- Records of li_store_flow
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_trade
-- ----------------------------
DROP TABLE IF EXISTS `li_trade`;

CREATE TABLE `li_trade` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `consignee_address_id_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址id',
  `consignee_address_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址名称',
  `consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货人姓名',
  `discount_price` double(10, 2) DEFAULT NULL COMMENT '优惠的金额',
  `flow_price` double(10, 2) DEFAULT NULL COMMENT '总价格',
  `freight_price` double(10, 2) DEFAULT NULL COMMENT '运费',
  `goods_price` double(10, 2) DEFAULT NULL COMMENT '原价',
  `member_id` bigint DEFAULT NULL COMMENT '买家id',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '买家用户名',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付方式',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易编号',
  `delivery_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配送方式',
  `consignee_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收件人手机',
  `order_status` varchar(255) DEFAULT NULL COMMENT '交易状态',
  `receivable_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方支付流水',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易表';

-- ----------------------------
-- Records of li_trade
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_bill
-- ----------------------------
DROP TABLE IF EXISTS `li_bill`;

CREATE TABLE `li_bill` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司银行账号',
  `bank_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支行联行号',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '开户银行支行名称',
  `bill_price` double(20, 2) DEFAULT NULL COMMENT '最终结算金额',
  `bill_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态 OUT(已出账),CHECK(已对账),EXAMINE(已审核),PAY(已付款)',
  `commission_price` double(10, 2) DEFAULT NULL COMMENT '平台收取佣金',
  `distribution_commission` double(10, 2) DEFAULT NULL COMMENT '分销返现支出',
  `distribution_refund_commission` double(10, 2) DEFAULT NULL COMMENT '分销订单退还',
  `order_price` double(10, 2) DEFAULT NULL COMMENT '结算周期内订单付款总金额',
  `pay_time` datetime(6) DEFAULT NULL COMMENT '平台付款时间',
  `refund_commission_price` double(10, 2) DEFAULT NULL COMMENT '退单产生退还佣金金额',
  `refund_price` double(10, 2) DEFAULT NULL COMMENT '退单金额',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `site_coupon_commission` double(10, 2) DEFAULT NULL COMMENT '平台优惠券补贴',
  `site_coupon_refund_commission` double(10, 2) DEFAULT NULL COMMENT '退货平台优惠券补贴返还',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账单号',
  `end_time` datetime(6) DEFAULT NULL COMMENT '结算结束时间',
  `start_time` datetime(6) DEFAULT NULL COMMENT '结算开始时间',
  `point_settlement_price` double DEFAULT '0' COMMENT '积分商品结算金额 ',
  `kanjia_settlement_price` double DEFAULT '0' COMMENT '砍价商品结算金额',
  `wallet_price` decimal(20,2) DEFAULT NULL COMMENT '钱包支付结算金额',
  `offline_price` decimal(20,2) DEFAULT NULL COMMENT '线下转账（管理端确认收款）结算金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '账单表';

-- ----------------------------
-- Records of li_bill
-- ----------------------------
BEGIN;

COMMIT;

DROP TABLE IF EXISTS `li_payment_wakeup`;

CREATE TABLE `li_payment_wakeup` (
  `id` bigint NOT NULL COMMENT 'ID',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交易类型',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `payment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付名称',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付插件',
  `is_check` bit(1) NULL DEFAULT NULL COMMENT '已校验回查',
  `is_repeat` bit(1) NULL DEFAULT NULL COMMENT '是否重复支付',
  `is_pay` bit(1) NULL DEFAULT NULL COMMENT '已付款',
  `is_refund` bit(1) NULL DEFAULT NULL COMMENT '已退款',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `pay_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付发起交易号',
  `payment_receivable_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '第三方付款流水号',
  `payment_request_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '支付请求参数',
  `payment_response_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '支付响应',
  `out_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退款请求流水',
  `refund_receivable_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '第三方退款流水号',
  `refund_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '退款失败错误消息',
  `client_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户端类型',
  `timeout_express` datetime(6) NULL DEFAULT NULL COMMENT '支付过期时间',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `combine_out_trade_no` varchar(255) DEFAULT NULL COMMENT '合单支付单号',
  `member_id` varchar(255) DEFAULT NULL COMMENT '会员ID',
  `combine_detail` text DEFAULT NULL COMMENT '交易详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic COMMENT = '支付唤起日志表';

/**对公银行 **/
DROP TABLE IF EXISTS `li_corporate_bank`;

CREATE TABLE `li_corporate_bank` (
  `bank_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bank_alias_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `account_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `account_bank_code` int NULL DEFAULT NULL,
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `province_code` int NULL DEFAULT NULL,
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `city_code` int NULL DEFAULT NULL,
  `bank_branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bank_branch_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '对公银行表';

/**分账详细日志**/
DROP TABLE IF EXISTS `li_out_order_detail_log`;

CREATE TABLE `li_out_order_detail_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '订单单号',
  `sub_mchid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二级商户号',
  `sub_mch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二级商户号名称',
  `out_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商户分账单号',
  `amount` double(10, 2) NULL DEFAULT NULL COMMENT '分账金额',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分账单描述',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分账单状态',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `fail_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分账失败原因',
  `detail_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分账明细单号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分账详细日志表';

/**分账日志**/
DROP TABLE IF EXISTS `li_out_order_log`;

CREATE TABLE `li_out_order_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '订单单号',
  `sub_mchid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二级商户号',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信订单号-微信支付订单号',
  `out_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商户分账单号',
  `amount` double(10, 2) NULL DEFAULT NULL COMMENT '分账金额',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信分账单号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分账单状态'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '分账日志表';

/**个人银行**/
DROP TABLE IF EXISTS `li_personal_bank`;

CREATE TABLE `li_personal_bank` (
  `bank_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bank_alias_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `account_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `account_bank_code` int NULL DEFAULT NULL,
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `province_code` int NULL DEFAULT NULL,
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `city_code` int NULL DEFAULT NULL,
  `bank_branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bank_branch_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '个人银行表';

/**微信账单 **/
DROP TABLE IF EXISTS `li_wechat_bill`;

CREATE TABLE `li_wechat_bill` (
  `bill_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账单类型',
  `bill_date` datetime(6) NULL DEFAULT NULL COMMENT '账单日期',
  `download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账单下载地址',
  `account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资金账户类型',
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '是否删除',
  `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC COMMENT = '微信账单表';

/**提现日志**/
DROP TABLE IF EXISTS `li_withdraw_log`;

CREATE TABLE `li_withdraw_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `sub_mchid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二级商户号',
  `out_request_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商户预约提现单号',
  `amount` double(10, 2) NULL DEFAULT NULL COMMENT '分账金额',
  `withdraw_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信支付预约提现单号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '预约提现单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '提现日志表';

DROP TABLE IF EXISTS `li_wechat_applyment`;

CREATE TABLE `li_wechat_applyment` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) NULL DEFAULT NULL COMMENT '删除标志',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `out_request_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '业务申请编号',
  `organization_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '主体类型',
  `finance_institution` bit(1) NULL DEFAULT NULL COMMENT '是否金融机构',
  `business_license_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '营业执照/登记证书信息',
  `finance_institution_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '金融机构许可证信息',
  `id_holder_type` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '证件持有人类型',
  `id_doc_type` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '经营者/法人证件类型',
  `authorize_letter_copy` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '法定代表人说明函',
  `id_doc_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '经营者/法人其他类型证件信息',
  `owner` bit(1) NULL DEFAULT NULL COMMENT '经营者/法人是否为受益人',
  `ubo_info_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '最终受益人信息列表',
  `account_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '结算账户信息',
  `contact_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '超级管理员信息',
  `sales_scene_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '店铺信息',
  `settlement_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '结算规则',
  `merchant_shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商户简称',
  `qualifications` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '特殊资质',
  `business_addition_pics` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '补充材料',
  `business_addition_desc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '补充说明',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '状态',
  `applyment_state_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '申请状态描述',
  `error_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '错误信息',
  `sub_mchid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '特约商户号',
  `applyment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信支付申请单号',
  `id_card_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `sign_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '签约链接',
  `account_validation` text DEFAULT NULL COMMENT '汇款账户验证信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '微信进件表';

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
