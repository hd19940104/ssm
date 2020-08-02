/*
Navicat MySQL Data Transfer

Source Server         : hadoop104
Source Server Version : 50724
Source Host           : hadoop104:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-15 00:41:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `jointime` char(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('1', '1', '3', '6', '11', '2018-05-25 16:26:00');

-- ----------------------------
-- Table structure for t_fav_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_fav_goods`;
CREATE TABLE `t_fav_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fav_goods
-- ----------------------------
INSERT INTO `t_fav_goods` VALUES ('1', '3', '1');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `iconpath` varchar(255) DEFAULT NULL,
  `iconpath1` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `limitstock` int(11) DEFAULT NULL,
  `hot` char(1) DEFAULT NULL,
  `newgoods` char(1) DEFAULT NULL,
  `best` char(1) DEFAULT NULL,
  `priceunit` varchar(255) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `siremark` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `cstel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_category`;
CREATE TABLE `t_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `updateTime` char(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_category
-- ----------------------------
INSERT INTO `t_goods_category` VALUES ('1', '科技', '开启智慧未来', '1', '2018-05-22 11:42:38', '2018-05-22 11:42:38');
INSERT INTO `t_goods_category` VALUES ('2', '设计', '创意改变生活', '2', '2018-05-22 11:42:38', '2019-01-15 00:30:18');
INSERT INTO `t_goods_category` VALUES ('3', '农业', '网络天下肥美', '3', '2018-05-22 11:42:38', '2018-05-22 11:42:38');
INSERT INTO `t_goods_category` VALUES ('4', '其他', '发现更多惊喜', '4', '2018-05-22 11:42:38', '2018-05-22 11:42:38');

-- ----------------------------
-- Table structure for t_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_info`;
CREATE TABLE `t_goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `buycnt` int(11) DEFAULT NULL,
  `goodcnt` int(11) DEFAULT NULL,
  `favcnt` int(11) DEFAULT NULL,
  `sellcnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_info
-- ----------------------------
INSERT INTO `t_goods_info` VALUES ('1', '3', null, null, '1', null);
INSERT INTO `t_goods_info` VALUES ('3', '5', null, null, null, null);
INSERT INTO `t_goods_info` VALUES ('4', '6', null, null, null, null);

-- ----------------------------
-- Table structure for t_goods_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_tag`;
CREATE TABLE `t_goods_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_tag
-- ----------------------------
INSERT INTO `t_goods_tag` VALUES ('1', '3', '5');
INSERT INTO `t_goods_tag` VALUES ('4', '5', '5');
INSERT INTO `t_goods_tag` VALUES ('5', '5', '6');
INSERT INTO `t_goods_tag` VALUES ('6', '6', '5');
INSERT INTO `t_goods_tag` VALUES ('7', '6', '6');

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) DEFAULT NULL,
  `memberpswd` char(32) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `loginstatus` char(1) DEFAULT NULL,
  `authstatus` char(1) DEFAULT NULL,
  `sellerstatus` char(1) DEFAULT NULL,
  `lockstatus` char(1) DEFAULT NULL,
  `regtime` char(19) DEFAULT NULL,
  `lastvisittime` char(19) DEFAULT NULL,
  `email` char(19) DEFAULT NULL,
  `loginnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('3', 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo', null, '0', '0', '0', '0', '2019-01-15 00:35:14', '2019-01-15 00:38:56', 'demo@qq.com', '3');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `ordernum` varchar(255) DEFAULT NULL,
  `status` char(2) DEFAULT NULL COMMENT '待付款，待发货，待收货，待评价，交易成功、退款， 交易关闭',
  `createtime` char(19) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `paytype` char(1) DEFAULT NULL,
  `payprice` int(11) DEFAULT NULL,
  `ispay` char(1) DEFAULT NULL,
  `paytime` char(19) DEFAULT NULL,
  `issend` char(1) DEFAULT NULL,
  `sendtime` char(19) DEFAULT NULL,
  `isreceipt` char(1) DEFAULT NULL,
  `receipttime` char(19) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('2', '1', null, '00', '2018-05-25 17:01:52', '66', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
INSERT INTO `t_order_item` VALUES ('1', '2', '3', '6', '11');

-- ----------------------------
-- Table structure for t_seller_info
-- ----------------------------
DROP TABLE IF EXISTS `t_seller_info`;
CREATE TABLE `t_seller_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `cstel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seller_info
-- ----------------------------
INSERT INTO `t_seller_info` VALUES ('6', '1', '55', '55', '55', '55');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('1', '电商平台商品标签', '0', 'glyphicon glyphicon-home');
INSERT INTO `t_tag` VALUES ('2', '手机', '1', null);
INSERT INTO `t_tag` VALUES ('3', '数码', '1', null);
INSERT INTO `t_tag` VALUES ('4', '电脑', '1', null);
INSERT INTO `t_tag` VALUES ('5', '超极本', '2', null);
INSERT INTO `t_tag` VALUES ('6', '电源', '2', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) DEFAULT NULL,
  `userpswd` char(32) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员');
