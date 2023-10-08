drop database if exists lilishop_goods;

create database lilishop_goods CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use lilishop_goods;

SET
  NAMES utf8mb4;

SET
  FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for li_brand
-- ----------------------------
DROP TABLE IF EXISTS `li_brand`;

CREATE TABLE `li_brand` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '品牌图标',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '品牌名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '品牌表';

-- ----------------------------
-- Table structure for li_category
-- ----------------------------
DROP TABLE IF EXISTS `li_category`;

CREATE TABLE `li_category` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `commission_rate` decimal(10, 2) DEFAULT NULL COMMENT '佣金比例',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类图标',
  `level` int DEFAULT NULL COMMENT '层级',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `sort_order` int DEFAULT '0' COMMENT '排序值',
  `support_channel` bit(1) DEFAULT NULL COMMENT '是否支持频道',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '分类表';

-- ----------------------------
-- Records of li_category
-- ----------------------------
-- ----------------------------
-- Table structure for li_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `li_category_brand`;

CREATE TABLE `li_category_brand` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '分类品牌关联表';

-- ----------------------------
-- Table structure for li_category_parameter_group
-- ----------------------------
DROP TABLE IF EXISTS `li_category_parameter_group`;

CREATE TABLE `li_category_parameter_group` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `category_id` bigint DEFAULT '0' COMMENT '关联分类ID',
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数组名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '分类参数组表';

-- ----------------------------
-- Table structure for li_category_specification
-- ----------------------------
DROP TABLE IF EXISTS `li_category_specification`;

CREATE TABLE `li_category_specification` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `specification_id` bigint DEFAULT NULL COMMENT '规格ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '分类规格关联表';

-- ----------------------------
-- Table structure for li_draft_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_draft_goods`;

CREATE TABLE `li_draft_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `buy_count` int DEFAULT NULL COMMENT '购买数量',
  `category_name_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '分类名称json',
  `category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类path',
  `comment_num` int DEFAULT NULL COMMENT '评论数量',
  `cost` double(20, 2) DEFAULT NULL COMMENT '成本价格',
  `enable_quantity` int DEFAULT NULL COMMENT '可用库存',
  `freight_payer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '运费承担者',
  `goods_gallery_list_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品图片json',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `goods_params_list_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品参数json',
  `goods_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '计量单位',
  `goods_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品视频',
  `grade` double(20, 2) DEFAULT NULL COMMENT '商品好评率',
  `intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品详情',
  `mobile_intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品移动端详情',
  `original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原图路径',
  `price` double(20, 2) DEFAULT NULL COMMENT '商品价格',
  `quantity` int DEFAULT NULL COMMENT '库存',
  `recommend` bit(1) DEFAULT NULL COMMENT '是否为推荐商品',
  `sales_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '销售模式',
  `save_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '草稿商品保存类型',
  `self_operated` bit(1) DEFAULT NULL COMMENT '是否自营',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `selling_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '卖点',
  `shop_category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺分类',
  `sku_list_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '货品列表json',
  `small` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '小图路径',
  `sn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品编号',
  `template_id` bigint DEFAULT NULL COMMENT '运费模板ID',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图',
  `weight` double(20, 2) DEFAULT NULL COMMENT '重量',
  `store_category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺分类路径',
  `big` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大图路径',
  `market_enable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `goods_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '草稿商品表';

-- ----------------------------
-- Records of li_draft_goods
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_goods
-- ----------------------------
DROP TABLE IF EXISTS `li_goods`;

CREATE TABLE `li_goods` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `auth_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核信息',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `buy_count` int DEFAULT '0' COMMENT '购买数量',
  `category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类路径',
  `comment_num` int DEFAULT NULL COMMENT '评论数量',
  `cost` double(10, 2) DEFAULT NULL COMMENT '成本价格',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `goods_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '计量单位',
  `goods_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品视频',
  `grade` double(10, 2) DEFAULT NULL COMMENT '商品好评率',
  `intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品详情',
  `auth_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核状态',
  `market_enable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上架状态',
  `mobile_intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品移动端详情',
  `original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原图路径',
  `price` double(10, 2) DEFAULT NULL COMMENT '商品价格',
  `quantity` int DEFAULT '0' COMMENT '库存',
  `recommend` bit(1) DEFAULT NULL COMMENT '是否为推荐商品',
  `sales_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '销售模式',
  `self_operated` bit(1) DEFAULT NULL COMMENT '是否自营',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `selling_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '卖点',
  `shop_category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺分类',
  `small` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '小图路径',
  `sn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品编号',
  `template_id` bigint DEFAULT NULL COMMENT '运费模板ID',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图路径',
  `under_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '下架原因',
  `weight` double(10, 2) DEFAULT NULL COMMENT '重量',
  `store_category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺分类路径',
  `big` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大图路径',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `goods_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品表';

-- ----------------------------
-- Table structure for li_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `li_goods_gallery`;

CREATE TABLE `li_goods_gallery` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `is_default` int DEFAULT NULL COMMENT '是否是默认图片',
  `original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原图路径',
  `small` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '小图路径',
  `sort` int DEFAULT NULL COMMENT '排序',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品图片表';

-- ----------------------------
-- Table structure for li_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `li_goods_sku`;

CREATE TABLE `li_goods_sku` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `auth_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核信息',
  `big` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大图路径',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `buy_count` int DEFAULT NULL COMMENT '购买数量',
  `category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类路径',
  `comment_num` int DEFAULT NULL COMMENT '评价数量',
  `cost` double(20, 2) DEFAULT NULL COMMENT '成本价格',
  `freight_payer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '运费承担者',
  `freight_template_id` bigint DEFAULT NULL COMMENT '配送模版ID',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `goods_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '计量单位',
  `goods_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品视频',
  `grade` double(20, 2) DEFAULT NULL COMMENT '商品好评率',
  `intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '商品详情',
  `auth_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核状态',
  `promotion_flag` bit(1) DEFAULT NULL COMMENT '是否是促销商品',
  `market_enable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上架状态',
  `mobile_intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '移动端商品详情',
  `original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原图路径',
  `price` double(20, 2) DEFAULT NULL COMMENT '商品价格',
  `promotion_price` double(20, 2) DEFAULT NULL COMMENT '促销价',
  `quantity` int DEFAULT NULL COMMENT '库存',
  `recommend` bit(1) NOT NULL COMMENT '是否为推荐商品',
  `sales_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '销售模式',
  `self_operated` bit(1) DEFAULT NULL COMMENT '是否自营',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺名称',
  `selling_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '卖点',
  `small` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '小图路径',
  `sn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品编号',
  `specs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '规格信息json',
  `template_id` bigint DEFAULT NULL COMMENT '运费模板id',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缩略图路径',
  `under_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '下架原因',
  `view_count` int DEFAULT NULL COMMENT '浏览数量',
  `weight` double(20, 2) DEFAULT NULL COMMENT '重量',
  `simple_specs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '规格信息',
  `store_category_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺分类路径',
  `goods_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE COMMENT '商品id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '商品SKU表';

-- ----------------------------
-- Table structure for li_goods_unit
-- ----------------------------
DROP TABLE IF EXISTS `li_goods_unit`;

CREATE TABLE `li_goods_unit` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '计量单位名称',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品单位表';

-- ----------------------------
-- Records of li_goods_unit
-- ----------------------------
BEGIN;

INSERT INTO
  `li_goods_unit` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `name`
  )
VALUES
  (
    1376371484724822016,
    'admin',
    '2021-03-28 22:11:48.361000',
    0,
    'admin',
    '2021-07-09 16:29:24.889000',
    '只'
  );

INSERT INTO
  `li_goods_unit` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `name`
  )
VALUES
  (
    1376371500533153792,
    'admin',
    '2021-03-28 22:11:52.130000',
    0,
    NULL,
    NULL,
    '件'
  );

INSERT INTO
  `li_goods_unit` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `name`
  )
VALUES
  (
    1376371521315930112,
    'admin',
    '2021-03-28 22:11:57.085000',
    0,
    NULL,
    NULL,
    '份'
  );

INSERT INTO
  `li_goods_unit` (
    `id`,
    `create_by`,
    `create_time`,
    `delete_flag`,
    `update_by`,
    `update_time`,
    `name`
  )
VALUES
  (
    1376371538806177792,
    'admin',
    '2021-03-28 22:12:01.255000',
    0,
    'admin',
    '2021-09-22 15:18:18.907000',
    '克'
  );

COMMIT;

-- ----------------------------
-- Table structure for li_goods_words
-- ----------------------------
DROP TABLE IF EXISTS `li_goods_words`;

CREATE TABLE `li_goods_words` (
  `id` bigint NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `abbreviate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `whole_spell` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品关键字表';

-- ----------------------------
-- Records of li_goods_words
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_goods_collection
-- ----------------------------
DROP TABLE IF EXISTS `li_goods_collection`;

CREATE TABLE `li_goods_collection` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `member_id` bigint DEFAULT NULL COMMENT '会员id',
  `sku_id` bigint DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE COMMENT '会员id'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品收藏表';

-- ----------------------------
-- Records of li_goods_collection
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for li_parameters
-- ----------------------------
DROP TABLE IF EXISTS `li_parameters`;

CREATE TABLE `li_parameters` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `group_id` bigint DEFAULT NULL COMMENT '参数分组ID',
  `is_index` int DEFAULT NULL COMMENT '是否可索引必选',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选择值',
  `param_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数名称',
  `param_type` int DEFAULT NULL COMMENT '参数类型',
  `required` int DEFAULT NULL COMMENT '是否必填',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品参数表';

-- ----------------------------
-- Table structure for li_specification
-- ----------------------------
DROP TABLE IF EXISTS `li_specification`;

CREATE TABLE `li_specification` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `spec_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '规格名称',
  `store_id` bigint DEFAULT NULL COMMENT '所属店铺',
  `spec_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品规格表';

-- ----------------------------
-- Table structure for li_store_goods_label
-- ----------------------------
DROP TABLE IF EXISTS `li_store_goods_label`;

CREATE TABLE `li_store_goods_label` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '店铺商品分类名称',
  `level` int DEFAULT NULL COMMENT '层级',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `store_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `sort_order` decimal(19, 2) DEFAULT NULL COMMENT '店铺商品分类排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE COMMENT '店铺id索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '店铺商品分类表';

-- ----------------------------
-- Table structure for li_wholesale
-- ----------------------------
DROP TABLE IF EXISTS `li_wholesale`;

CREATE TABLE `li_wholesale` (
  `id` bigint NOT NULL COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `delete_flag` bit(1) DEFAULT NULL COMMENT '删除标志 true/false 删除/未删除',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '价格',
  `goods_id` bigint DEFAULT NULL COMMENT '商品id',
  `sku_id` bigint DEFAULT NULL COMMENT '商品skuId',
  `template_id` bigint DEFAULT NULL COMMENT '商品模版Id',
  `num` int DEFAULT NULL COMMENT '起购量',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '批发规则表';

-- ----------------------------
-- Records of li_wholesale
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

SET
  FOREIGN_KEY_CHECKS = 1;