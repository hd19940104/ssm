/*
Navicat MySQL Data Transfer

Source Server         : hadoop114
Source Server Version : 50721
Source Host           : 192.168.1.114:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-09-26 08:55:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for edu_edmo_pms_user
-- ----------------------------
DROP TABLE IF EXISTS `edu_edmo_pms_user`;
CREATE TABLE `edu_edmo_pms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT 'version',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_no` varchar(50) NOT NULL COMMENT '用户帐号',
  `user_type` varchar(1) NOT NULL COMMENT '用户类型（1:超级管理员，2:普通管理员，3:用户主帐号，4:用户子帐号）',
  `main_user_id` bigint(50) DEFAULT '0' COMMENT '主帐号ID',
  `user_pwd` varchar(256) NOT NULL COMMENT '登录密码',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile_no` varchar(15) DEFAULT NULL COMMENT '手机号',
  `email` varbinary(100) DEFAULT NULL COMMENT '邮箱',
  `status` int(11) NOT NULL COMMENT '状态(100:可用，101:不可用 )',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_changed_pwd` int(11) DEFAULT NULL COMMENT '是否更改过密码',
  `pwd_error_count` int(11) NOT NULL DEFAULT '0' COMMENT '连续输错密码次数',
  `pwd_error_time` datetime DEFAULT NULL COMMENT '最后输错密码时间',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `AK_Key_2` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of edu_edmo_pms_user
-- ----------------------------
INSERT INTO `edu_edmo_pms_user` VALUES ('1', '0', '2019-05-25 11:36:33', 'admin', '1', '0', '7c4a8d09ca3762af61e59520943dc26494f8941b', '超级管理员', '13800138000', null, '100', null, '0', '0', null, '超级管理员');

-- ----------------------------
-- Table structure for mb_user
-- ----------------------------
DROP TABLE IF EXISTS `mb_user`;
CREATE TABLE `mb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `weixinopenid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of mb_user
-- ----------------------------
INSERT INTO `mb_user` VALUES ('76', 'houdong', 'CFFC8D956396EFFAB996CDD789872E91', '13040860815', '1183486985@qq.com', '2019-09-04 15:52:51', '2019-09-04 15:52:51', null, null);

-- ----------------------------
-- Table structure for payment_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) NOT NULL COMMENT '支付类',
  `orderid` bigint(20) NOT NULL COMMENT '订单编号',
  `platformorderid` varchar(500) DEFAULT NULL COMMENT '第三方支付平台订单id',
  `price` bigint(20) NOT NULL COMMENT '商品价格 单位：分',
  `source` varchar(10) NOT NULL COMMENT '渠道来源',
  `state` varchar(2) NOT NULL COMMENT '状态 1待支付 1支付成功 2支付失败',
  `paymessage` varchar(1000) DEFAULT NULL COMMENT '支付报文',
  `txnTime` datetime DEFAULT NULL COMMENT '订单发起时间',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='支付信息表';

-- ----------------------------
-- Records of payment_info
-- ----------------------------
INSERT INTO `payment_info` VALUES ('38', '37', '2019050712231', '981905081047330380038', '12', '1', '1', '{\"bizType\":\"000201\",\"orderId\":\"2019050712231\",\"signature\":\"TjHyM2QbIzOWk90sOEI+jdLk5UmFpwFGiOwX1SHXk2jqMXGg9+DBNwZNkdkpS4hB445i8CTzSpU4NKYIkOiPYAqDGRSj8Xc/1PvRWaBdxPNXLZZs+pYOi+y3rHFPoER/Ddif42I/SwM/YOMVbdlyqsnQWjPMXg7Sr3YHhblnKXz9GOI55n9IjMSj2/TOo6TFL9Iv089MvtfSjOGNT887MSGIvDbxi7ZHUDeF95V9yo6f7ssJVM1HGDQCHBw8zWKa0WgPqXe0HlI+zPrHuaGz8ZJ+1RiPiYyX1q+5yVTi4w2dWniJ9KEMpCSBI9bXhjwMBQO0cv9AIIWTdDHky7ssog==\",\"traceNo\":\"038003\",\"settleAmt\":\"12\",\"settleCurrencyCode\":\"156\",\"settleDate\":\"0508\",\"txnType\":\"01\",\"queryId\":\"981905081047330380038\",\"accessType\":\"0\",\"payType\":\"0001\",\"traceTime\":\"0508104733\",\"txnTime\":\"20190508104733\",\"payCardType\":\"01\",\"txnSubType\":\"01\",\"accNo\":\"6216***********0018\",\"certId\":\"69026276696\",\"encoding\":\"UTF-8\",\"version\":\"5.0.0\",\"respMsg\":\"Success!\",\"merId\":\"777290058110048\",\"currencyCode\":\"156\",\"respCode\":\"00\",\"signMethod\":\"01\",\"txnAmt\":\"12\"}', null, '2019-05-07 16:50:47', '2019-05-08 11:11:14');
INSERT INTO `payment_info` VALUES ('39', '37', '2019050712232', '981905081102340433788', '100000000', '1', '1', '{\"bizType\":\"000201\",\"orderId\":\"2019050712232\",\"signature\":\"kE3oClgTswd7uRsvFUilfQBmmK9glhlWTp+PSJcS+1eq4MiieVWb0NwdoiM0HNVlAPeyCB6WByyDVi0GPvjoS4iJr4XguVEY5m1hsSMOf3dr5plMeX7Z/QQpuWsR/FZNmYcjpdc3aZfx31gK/EyvtRwdg1++YJZj9xNAX5gEXSv5UUZUrxBzC0A0/p5urqGRmPNS3iFhT19P86nOh54HncTDXJKMfxvX+oPwRFnRmk8GVNW5dOk3CFgjUcBa2srXS1mJSrxB1Qxz2yTaSmx3+CqAcVxVhw/WtgoHITIh6LjbRpovcojRZ5lnYjkBZOANpfdieupyfgVvhmzT5dNZiw==\",\"traceNo\":\"043378\",\"settleAmt\":\"100000000\",\"settleCurrencyCode\":\"156\",\"settleDate\":\"0508\",\"txnType\":\"01\",\"queryId\":\"981905081102340433788\",\"accessType\":\"0\",\"payType\":\"0001\",\"traceTime\":\"0508110234\",\"txnTime\":\"20190508110234\",\"payCardType\":\"01\",\"txnSubType\":\"01\",\"accNo\":\"6216***********0018\",\"certId\":\"69026276696\",\"encoding\":\"UTF-8\",\"version\":\"5.0.0\",\"respMsg\":\"Success!\",\"merId\":\"777290058110048\",\"currencyCode\":\"156\",\"respCode\":\"00\",\"signMethod\":\"01\",\"txnAmt\":\"100000000\"}', null, '2019-05-08 11:01:58', '2019-05-08 11:11:53');
INSERT INTO `payment_info` VALUES ('40', '37', '2019050712232', null, '1000000', '1', '0', null, null, '2019-05-08 11:32:38', '2019-05-08 11:32:38');
INSERT INTO `payment_info` VALUES ('41', '37', '2019050712233', '401905081200542535008', '1000000', '1', '1', '{\"bizType\":\"000201\",\"orderId\":\"2019050712233\",\"signature\":\"trM87o60V6LR4pgtTYJwwZimj3hTAdCtFV4e769Fy+bKKA4Y6XrVVg29b2mCcjM8bLGDrIqoJiOKvo+J6oxO3OLU9cIowqV04r7b0TrZf6iwI5NtCgnZux7k84wI6iDg54Fqs9j8gIr6ykYrzu6jU9vMWhIZ8L+3nG602DKFcc6r0GlU2UVpDXi4SzrDsG+6U2RQkyVlHSHbpiKc4krSBMw/df8CG0zkZK837yDn5tFLQaj8czizAx4+9iGneainImdexjizjp+Fyb1Sgzs2uZDfgvWRhihrK8INiW2AHRNFpzRwmSV6KBnWACCGi61dAysDr4flSP3owSKg+5KRdw==\",\"traceNo\":\"253500\",\"settleAmt\":\"1000000\",\"settleCurrencyCode\":\"156\",\"settleDate\":\"0508\",\"txnType\":\"01\",\"queryId\":\"401905081200542535008\",\"accessType\":\"0\",\"payType\":\"0001\",\"traceTime\":\"0508120054\",\"txnTime\":\"20190508120054\",\"payCardType\":\"01\",\"txnSubType\":\"01\",\"accNo\":\"6216***********0018\",\"certId\":\"69026276696\",\"encoding\":\"UTF-8\",\"version\":\"5.0.0\",\"respMsg\":\"Success!\",\"merId\":\"777290058110048\",\"currencyCode\":\"156\",\"respCode\":\"00\",\"signMethod\":\"01\",\"txnAmt\":\"1000000\"}', null, '2019-05-08 11:32:45', '2019-05-08 12:03:18');
INSERT INTO `payment_info` VALUES ('42', '37', '2019050712234', null, '1000000', '1', '0', null, null, '2019-05-08 12:04:01', '2019-05-08 12:04:01');
INSERT INTO `payment_info` VALUES ('43', '47', '2019050712234', null, '15040000', '1', '0', null, null, '2019-05-08 12:04:38', '2019-05-08 12:04:38');
INSERT INTO `payment_info` VALUES ('44', '37', '2019050712254', '981905081206450388768', '80040000', '1', '1', '{\"bizType\":\"000201\",\"orderId\":\"2019050712254\",\"signature\":\"N367u4k7vg/HBhQrG5MFr+Djfh6MUOAl5ZaRGddsb8f8WtCtSVHrT12hTzYkwg6BleL5qZGKjb+lBA61x6cYcp3kzOCaawh2n3jsf659Mk8IH5T/YdGTP5d7bHL+7xkX6BWcHj0bK+VHBok26bUIxs+pgcv7gnlQ4vYgHPFC5amu7WRAv6M/JBB5c5GeBG2OUGf15aVM/rh96/sEwZrKQHy7s9oRtWVanJ8D0TB6aow4zbMO501jJZ7bvy8uSvBb9rjTSX+EnmyVhkE82dW25j8kO40OJjSeLoMvC7Y7cA2ajthik7u0E6JLNxjhHczVWEjmb3MRmD6cGuij8dGuCw==\",\"traceNo\":\"038876\",\"settleAmt\":\"80040000\",\"settleCurrencyCode\":\"156\",\"settleDate\":\"0508\",\"txnType\":\"01\",\"queryId\":\"981905081206450388768\",\"accessType\":\"0\",\"payType\":\"0001\",\"traceTime\":\"0508120645\",\"txnTime\":\"20190508120645\",\"payCardType\":\"01\",\"txnSubType\":\"01\",\"accNo\":\"6216***********0018\",\"certId\":\"69026276696\",\"encoding\":\"UTF-8\",\"version\":\"5.0.0\",\"respMsg\":\"Success!\",\"merId\":\"777290058110048\",\"currencyCode\":\"156\",\"respCode\":\"00\",\"signMethod\":\"01\",\"txnAmt\":\"80040000\"}', null, '2019-05-08 12:06:14', '2019-05-08 12:07:16');
INSERT INTO `payment_info` VALUES ('45', '37', '2019050712264', null, '30040000', '1', '0', null, null, '2019-05-08 12:08:28', '2019-05-08 12:08:28');
INSERT INTO `payment_info` VALUES ('46', '37', '2019050712278', '691905152253401513768', '40040000', '1', '1', '{\"bizType\":\"000201\",\"orderId\":\"2019050712278\",\"signature\":\"rxeowXlaeSRCAApq7vvI/cOG2DVaaZp8LOBQNHR7ho8VaJ5lgPCPuFBE2UqAjayVpsNPLJS2+lz6kg7MMO2fRADb7pcdSBkd6KZr5fWRLvNa0W8dX0SP7JgF7gwU85N5VIOmROaBgP1OLHTs6Uc/xbqN5oJkYPQR6NTMcgO6X37L9aP3HR5JVPAiEL+KTpZlAnpO0p7SBZnMi2ZYQrguZggAHqtZQi+hBXYmTNuyNtVrVWpP1vfsipmPmPM6O39Jhwv1xoza0zotvrFvI/TXQf3J7EqrjWuPvY0i7nBL+X7OQhkWS01VY/4G4pTsMyZHR0afRJSChGB5lhth+fT+wA==\",\"traceNo\":\"151376\",\"settleAmt\":\"40040000\",\"settleCurrencyCode\":\"156\",\"settleDate\":\"0515\",\"txnType\":\"01\",\"queryId\":\"691905152253401513768\",\"accessType\":\"0\",\"payType\":\"0001\",\"traceTime\":\"0515225340\",\"txnTime\":\"20190515225340\",\"payCardType\":\"01\",\"txnSubType\":\"01\",\"accNo\":\"6216***********0018\",\"certId\":\"69026276696\",\"encoding\":\"UTF-8\",\"version\":\"5.0.0\",\"respMsg\":\"Success!\",\"merId\":\"777290058110048\",\"currencyCode\":\"156\",\"respCode\":\"00\",\"signMethod\":\"01\",\"txnAmt\":\"40040000\"}', null, '2019-05-15 22:53:08', '2019-05-15 22:55:11');
INSERT INTO `payment_info` VALUES ('47', '47', '20190507122241', null, '40000', '1', '0', null, null, '2019-05-16 15:28:02', '2019-05-16 15:28:02');
INSERT INTO `payment_info` VALUES ('48', '47', '20190507122341', null, '40040000', '1', '0', null, null, '2019-05-16 17:01:59', '2019-05-16 17:01:59');
INSERT INTO `payment_info` VALUES ('49', '47', '20190507122341', null, '40000', '1', '0', null, null, '2019-05-16 17:03:20', '2019-05-16 17:03:20');
INSERT INTO `payment_info` VALUES ('50', '47', '20112312312341', '2019051622001423281000047690', '10', '1', '1', '{gmt_create=2019-05-16 17:12:05, charset=utf-8, gmt_payment=2019-05-16 17:12:15, notify_time=2019-05-16 17:12:16, subject=????, buyer_id=2088102178023284, invoice_amount=10.00, version=1.0, notify_id=2019051600222171216023281000222115, fund_bill_list=[{\"amount\":\"10.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=20112312312341, total_amount=10.00, trade_status=TRADE_SUCCESS, trade_no=2019051622001423281000047690, auth_app_id=2016092900626012, receipt_amount=10.00, point_amount=0.00, app_id=2016092900626012, buyer_pay_amount=10.00, seller_id=2088102177846596}', null, '2019-05-16 17:10:37', '2019-05-16 17:10:37');
INSERT INTO `payment_info` VALUES ('51', '47', '202342342312312341', '2019051622001423281000049038', '10', '1', '1', '{gmt_create=2019-05-16 17:21:58, charset=utf-8, gmt_payment=2019-05-16 17:22:05, notify_time=2019-05-16 17:22:06, subject=????, buyer_id=2088102178023284, invoice_amount=10.00, version=1.0, notify_id=2019051600222172206023281000229228, fund_bill_list=[{\"amount\":\"10.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=202342342312312341, total_amount=10.00, trade_status=TRADE_SUCCESS, trade_no=2019051622001423281000049038, auth_app_id=2016092900626012, receipt_amount=10.00, point_amount=0.00, app_id=2016092900626012, buyer_pay_amount=10.00, seller_id=2088102177846596}', null, '2019-05-16 17:18:36', '2019-05-16 17:18:36');
INSERT INTO `payment_info` VALUES ('52', '47', '2019051612345', '2019051622001423281000049039', '10', '1', '1', '{gmt_create=2019-05-16 17:28:29, charset=utf-8, gmt_payment=2019-05-16 17:28:36, notify_time=2019-05-16 17:28:37, subject=????, buyer_id=2088102178023284, invoice_amount=10.00, version=1.0, notify_id=2019051600222172837023281000226582, fund_bill_list=[{\"amount\":\"10.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=2019051612345, total_amount=10.00, trade_status=TRADE_SUCCESS, trade_no=2019051622001423281000049039, auth_app_id=2016092900626012, receipt_amount=10.00, point_amount=0.00, app_id=2016092900626012, buyer_pay_amount=10.00, seller_id=2088102177846596}', null, '2019-05-16 17:27:52', '2019-05-16 17:27:52');
INSERT INTO `payment_info` VALUES ('53', '47', '2019051612345', null, '2998', '1', '0', null, null, '2019-05-16 17:38:56', '2019-05-16 17:38:56');
INSERT INTO `payment_info` VALUES ('54', '47', '2019051612245', '2019051622001423281000046512', '2998', '1', '1', '{gmt_create=2019-05-16 17:41:17, charset=utf-8, gmt_payment=2019-05-16 17:44:41, notify_time=2019-05-16 17:44:42, subject=????, buyer_id=2088102178023284, invoice_amount=2998.00, version=1.0, notify_id=2019051600222174441023281000229229, fund_bill_list=[{\"amount\":\"2998.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=2019051612245, total_amount=2998.00, trade_status=TRADE_SUCCESS, trade_no=2019051622001423281000046512, auth_app_id=2016092900626012, receipt_amount=2998.00, point_amount=0.00, app_id=2016092900626012, buyer_pay_amount=2998.00, seller_id=2088102177846596}', null, '2019-05-16 17:39:00', '2019-05-16 17:39:00');
INSERT INTO `payment_info` VALUES ('55', '47', '2019051612212', '2019051622001423281000047692', '12998', '1', '1', '{gmt_create=2019-05-16 17:48:15, charset=utf-8, gmt_payment=2019-05-16 17:48:47, notify_time=2019-05-16 17:48:48, subject=????xs MAX, buyer_id=2088102178023284, invoice_amount=12998.00, version=1.0, notify_id=2019051600222174848023281000229230, fund_bill_list=[{\"amount\":\"12998.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=2019051612212, total_amount=12998.00, trade_status=TRADE_SUCCESS, trade_no=2019051622001423281000047692, auth_app_id=2016092900626012, receipt_amount=12998.00, point_amount=0.00, app_id=2016092900626012, buyer_pay_amount=12998.00, seller_id=2088102177846596}', null, '2019-05-16 17:47:44', '2019-05-16 17:47:44');
INSERT INTO `payment_info` VALUES ('56', '37', '20190511612312', null, '9999', '1', '0', null, null, '2019-05-16 17:58:41', '2019-05-16 17:58:41');
INSERT INTO `payment_info` VALUES ('57', '37', '201905123612312', null, '9999', '1', '0', null, null, '2019-05-16 19:08:37', '2019-05-16 19:08:37');

-- ----------------------------
-- Table structure for payment_type
-- ----------------------------
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL COMMENT '支付类型名称',
  `fronturl` varchar(500) DEFAULT NULL COMMENT '同步回调url',
  `backurl` varchar(500) DEFAULT NULL COMMENT '异步回调url',
  `merchantid` varchar(150) DEFAULT NULL COMMENT '商户id',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='支付类型表';

-- ----------------------------
-- Records of payment_type
-- ----------------------------
INSERT INTO `payment_type` VALUES ('37', 'yinlianPay', ' http://lovexixi.natapp1.cc/pay-web/yinlianpay/callback/syn', ' http://lovexixi.natapp1.cc/pay-web/yinlianpay/callback/asyn', ' 777290058110048', '2019-05-06 21:20:42', '2019-05-06 21:20:45');
INSERT INTO `payment_type` VALUES ('47', 'aliPay', null, null, null, null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员');

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` bigint(20) NOT NULL COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` bigint(20) NOT NULL COMMENT '商品价格，单位为：分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `parent_id` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of tb_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `img` varchar(150) DEFAULT NULL COMMENT '图片地址',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_desc`;
CREATE TABLE `tb_item_desc` (
  `id` bigint(20) NOT NULL COMMENT '商品ID',
  `itemdesc` text COMMENT '商品描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of tb_item_desc
-- ----------------------------
