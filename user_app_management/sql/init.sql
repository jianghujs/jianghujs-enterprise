/*
 Navicat Premium Data Transfer

 Source Server         : jianghu
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : 127.0.0.1:40002
 Source Schema         : jianghujs_enterprise_user_app_management

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 27/08/2022 21:39:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _app
-- ----------------------------
DROP TABLE IF EXISTS `_app`;
CREATE TABLE `_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'appId',
  `appGroup` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'app组',
  `appName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'app名',
  `appDesc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'app描述',
  `appUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'app链接',
  `appMenu` text COLLATE utf8mb4_bin COMMENT 'app菜单',
  `appType` varchar(255) COLLATE utf8mb4_bin DEFAULT 'internal' COMMENT '应用类型：internal，external',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `appId` (`appId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of _app
-- ----------------------------
BEGIN;
INSERT INTO `_app` (`id`, `appId`, `appGroup`, `appName`, `appDesc`, `appUrl`, `appMenu`, `appType`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`, `sort`) VALUES (12, 'user_app_management', 'base', '账号权限管理', NULL, NULL, NULL, 'internal', 'insert', NULL, NULL, NULL, NULL);
INSERT INTO `_app` (`id`, `appId`, `appGroup`, `appName`, `appDesc`, `appUrl`, `appMenu`, `appType`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`, `sort`) VALUES (13, 'data_repository', 'base', '数据中心管理', NULL, NULL, NULL, 'internal', 'insert', NULL, NULL, NULL, NULL);
INSERT INTO `_app` (`id`, `appId`, `appGroup`, `appName`, `appDesc`, `appUrl`, `appMenu`, `appType`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`, `sort`) VALUES (14, 'directory', 'base', 'APP目录', NULL, NULL, NULL, 'internal', 'insert', NULL, NULL, NULL, NULL);
INSERT INTO `_app` (`id`, `appId`, `appGroup`, `appName`, `appDesc`, `appUrl`, `appMenu`, `appType`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`, `sort`) VALUES (18, 'demo_xiaoapp', NULL, '小APPDemo项目', NULL, NULL, NULL, 'internal', 'jhInsert', 'admin', '系统管理员', '2022-02-24T20:18:14+08:00', NULL);
INSERT INTO `_app` (`id`, `appId`, `appGroup`, `appName`, `appDesc`, `appUrl`, `appMenu`, `appType`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`, `sort`) VALUES (19, 'test', NULL, 'uiAction test123', NULL, NULL, NULL, 'internal', 'jhUpdate', 'admin', '系统管理员', '2022-04-28T21:58:09+08:00', NULL);
INSERT INTO `_app` (`id`, `appId`, `appGroup`, `appName`, `appDesc`, `appUrl`, `appMenu`, `appType`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`, `sort`) VALUES (20, NULL, NULL, '123', NULL, NULL, NULL, 'internal', 'jhInsert', 'admin', '系统管理员', '2022-05-03T16:21:36+08:00', NULL);
COMMIT;

-- ----------------------------
-- Table structure for _cache
-- ----------------------------
DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '用户Id',
  `content` longtext COLLATE utf8mb4_bin COMMENT '缓存数据',
  `recordStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT 'active',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='缓存表';

-- ----------------------------
-- Records of _cache
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for _file
-- ----------------------------
DROP TABLE IF EXISTS `_file`;
CREATE TABLE `_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'fileId',
  `fileDirectory` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件保存路径;',
  `filename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件名;',
  `filenameStorage` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件保存名',
  `downloadPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件下载路径',
  `fileType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件类型;(预留字段)',
  `fileDesc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件描述',
  `binarySize` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件二进制大小',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fileId_index` (`fileId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件表; 软删除未启用;';

-- ----------------------------
-- Records of _file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for _group
-- ----------------------------
DROP TABLE IF EXISTS `_group`;
CREATE TABLE `_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'groupId',
  `groupName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '群组名',
  `groupDesc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '群组描述',
  `groupAvatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '群logo',
  `groupExtend` varchar(1024) COLLATE utf8mb4_bin DEFAULT '{}' COMMENT '拓展字段; { groupNotice: ''xx'' }',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='群组表; 软删除未启用;';

-- ----------------------------
-- Records of _group
-- ----------------------------
BEGIN;
INSERT INTO `_group` (`id`, `groupId`, `groupName`, `groupDesc`, `groupAvatar`, `groupExtend`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'adminGroup', '管理组', '管理组', NULL, '{}', 'insert', NULL, NULL, NULL);
INSERT INTO `_group` (`id`, `groupId`, `groupName`, `groupDesc`, `groupAvatar`, `groupExtend`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, 'wudang', '武当', '武当', NULL, '{}', 'insert', NULL, NULL, NULL);
INSERT INTO `_group` (`id`, `groupId`, `groupName`, `groupDesc`, `groupAvatar`, `groupExtend`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (7, 'gaibang', '丐帮', '丐帮', NULL, '{}', 'insert', NULL, NULL, NULL);
INSERT INTO `_group` (`id`, `groupId`, `groupName`, `groupDesc`, `groupAvatar`, `groupExtend`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (8, 'huashan', '华山派', '华山派', NULL, '{}', 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _page
-- ----------------------------
DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'pageId',
  `pageName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page name',
  `pageFile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page文件指定; 默认使用pageId.html',
  `pageType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `sort` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='页面表; 软删除未启用;';

-- ----------------------------
-- Records of _page
-- ----------------------------
BEGIN;
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 'help', '帮助', NULL, 'dynamicInMenu', '0', 'insert', NULL, NULL, NULL);
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 'login', '登陆', NULL, '', '', 'insert', NULL, NULL, NULL);
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (27, 'userManagement', '用户管理', NULL, 'showInMenu', '3', 'insert', NULL, NULL, NULL);
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (31, 'appManagement', 'App管理', NULL, 'showInMenu', '5', 'insert', NULL, NULL, NULL);
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (35, 'appManagementOfOneUser', '用户的App权限管理', NULL, 'dynamicInMenu', '4', 'insert', NULL, NULL, NULL);
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (36, 'userManagementOfOneApp', 'App的用户权限管理', NULL, 'dynamicInMenu', '6', 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _record_history
-- ----------------------------
DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` json DEFAULT NULL COMMENT '数据',
  `packageContent` json DEFAULT NULL COMMENT '当时请求的 package JSON',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_record_id` (`recordId`) USING BTREE,
  KEY `index_table_action` (`table`,`operation`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据历史表';

-- ----------------------------
-- Records of _record_history
-- ----------------------------
BEGIN;
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (55, '_user_session', 14, '{\"id\": 14, \"userId\": \"admin\", \"userIp\": \"127.0.0.1\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_0dbc1538_chrome\", \"authToken\": \"d18wBF5uc7kNaRrvETgGt7yYW6_BMu8WkfZC\", \"operation\": \"jhInsert\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"deviceType\": \"web\", \"operationAt\": \"2022-04-28T20:48:13+08:00\", \"socketStatus\": \"offline\", \"userIpRegion\": \"\", \"operationByUser\": null, \"operationByUserId\": null}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"login\", \"actionId\": \"passwordLogin\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"userId\": \"admin\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_0dbc1538_chrome\", \"password\": \"123456\"}}, \"packageId\": \"1651150092800_8604918\", \"packageType\": \"httpRequest\"}', 'jhInsert', NULL, NULL, '2022-04-28T20:48:13+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (56, '_user_session', 14, '{\"id\": 14, \"userId\": \"admin\", \"userIp\": \"127.0.0.1\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_0dbc1538_chrome\", \"authToken\": \"vljsNU0b4AY0ITqsum11CwsvQjx2t7DbW5m5\", \"operation\": \"jhUpdate\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"deviceType\": \"web\", \"operationAt\": \"2022-04-28T20:48:13+08:00\", \"socketStatus\": \"offline\", \"userIpRegion\": \"\", \"operationByUser\": null, \"operationByUserId\": null}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"login\", \"actionId\": \"passwordLogin\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"userId\": \"admin\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_0dbc1538_chrome\", \"password\": \"123456\"}}, \"packageId\": \"1651150093242_5919398\", \"packageType\": \"httpRequest\"}', 'jhUpdate', NULL, NULL, '2022-04-28T20:48:13+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (57, '_app', 19, '{\"id\": 19, \"sort\": null, \"appId\": \"test\", \"appUrl\": null, \"appDesc\": null, \"appMenu\": null, \"appName\": \"uiAction test\", \"appType\": \"internal\", \"appGroup\": null, \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T21:57:20+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagement\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"appName\": \"uiAction test\"}}, \"packageId\": \"1651154239751_6548860\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T21:57:20+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (58, '_app', 19, '{\"id\": 19, \"sort\": null, \"appId\": \"test\", \"appUrl\": null, \"appDesc\": null, \"appMenu\": null, \"appName\": \"uiAction test123\", \"appType\": \"internal\", \"appGroup\": null, \"operation\": \"jhUpdate\", \"operationAt\": \"2022-04-28T21:58:09+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"id\": 19}, \"pageId\": \"appManagement\", \"actionId\": \"updateItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"sort\": null, \"appId\": \"test\", \"appUrl\": null, \"appDesc\": null, \"appMenu\": null, \"appName\": \"uiAction test123\", \"appType\": \"internal\", \"appGroup\": null, \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T21:57:20+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}}, \"packageId\": \"1651154288590_9379578\", \"packageType\": \"httpRequest\"}', 'jhUpdate', 'admin', '系统管理员', '2022-04-28T21:58:09+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (59, '_user_app', 53, '{\"id\": 53, \"appId\": \"test\", \"userId\": \"U223P\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:16:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"U223P\"}}, \"packageId\": \"1651155407777_2556789\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:16:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (60, '_user_app', 54, '{\"id\": 54, \"appId\": \"test\", \"userId\": \"W00002\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:18:14+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"W00002\"}}, \"packageId\": \"1651155493965_6827084\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:18:14+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (61, '_user_app', 55, '{\"id\": 55, \"appId\": \"test\", \"userId\": \"W00001\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:18:16+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"W00001\"}}, \"packageId\": \"1651155495316_6289551\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:18:16+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (62, '_user_app', 56, '{\"id\": 56, \"appId\": \"demo_xiaoapp\", \"userId\": \"U223P\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:34:42+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"demo_xiaoapp\", \"userId\": \"U223P\"}}, \"packageId\": \"1651156480096_2094310\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:34:42+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (63, '_user_app', 57, '{\"id\": 57, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:37:44+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"admin\"}}, \"packageId\": \"1651156661740_2254393\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:37:44+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (64, '_user_app', 58, '{\"id\": 58, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:37:45+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"admin\"}}, \"packageId\": \"1651156664516_8005819\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:37:45+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (65, '_user_app', 59, '{\"id\": 59, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:37:46+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"admin\"}}, \"packageId\": \"1651156665740_9437711\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:37:46+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (66, '_user_app', 60, '{\"id\": 60, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:37:47+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"admin\"}}, \"packageId\": \"1651156666937_5078423\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:37:47+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (67, '_user_app', 61, '{\"id\": 61, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:37:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"admin\"}}, \"packageId\": \"1651156668136_5457427\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:37:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (68, '_user_app', 61, '{\"id\": 61, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:38:46+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"id\": 61}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156723912_5957151\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:38:46+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (69, '_user_app', 1, '{\"id\": 1, \"appId\": \"user_app_management\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (70, '_user_app', 2, '{\"id\": 2, \"appId\": \"data_repository\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (71, '_user_app', 4, '{\"id\": 4, \"appId\": \"directory\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (72, '_user_app', 52, '{\"id\": 52, \"appId\": \"demo_xiaoapp\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (73, '_user_app', 57, '{\"id\": 57, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (74, '_user_app', 58, '{\"id\": 58, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (75, '_user_app', 59, '{\"id\": 59, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (76, '_user_app', 60, '{\"id\": 60, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T22:39:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"admin\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651156787750_6229094\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T22:39:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (77, '_user_session', 15, '{\"id\": 15, \"userId\": \"admin\", \"userIp\": \"127.0.0.1\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_12d2f3c7_firefox\", \"authToken\": \"xNx55Wf3NaHXRmKxhzaXEikOyAnRFlDPAOGT\", \"operation\": \"jhInsert\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0\", \"deviceType\": \"web\", \"operationAt\": \"2022-04-28T22:44:41+08:00\", \"socketStatus\": \"offline\", \"userIpRegion\": \"\", \"operationByUser\": null, \"operationByUserId\": null}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"login\", \"actionId\": \"passwordLogin\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0\", \"actionData\": {\"userId\": \"admin\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_12d2f3c7_firefox\", \"password\": \"123456\"}}, \"packageId\": \"1651157080497_5718820\", \"packageType\": \"httpRequest\"}', 'jhInsert', NULL, NULL, '2022-04-28T22:44:41+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (78, '_user_app', 68, '{\"id\": 68, \"appId\": \"test\", \"userId\": \"0\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:53:46+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 0}}, \"packageId\": \"1651157625443_1048531\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:53:46+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (79, '_user_app', 69, '{\"id\": 69, \"appId\": \"test\", \"userId\": \"1\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:53:47+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 1}}, \"packageId\": \"1651157627029_3095053\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:53:47+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (80, '_user_app', 70, '{\"id\": 70, \"appId\": \"test\", \"userId\": \"2\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:53:49+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 2}}, \"packageId\": \"1651157628206_9685729\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:53:49+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (81, '_user_app', 71, '{\"id\": 71, \"appId\": \"test\", \"userId\": \"0\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:55:10+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 0}}, \"packageId\": \"1651157709803_9271353\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:55:10+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (82, '_user_app', 72, '{\"id\": 72, \"appId\": \"test\", \"userId\": \"1\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:55:12+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 1}}, \"packageId\": \"1651157711251_5860533\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:55:12+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (83, '_user_app', 73, '{\"id\": 73, \"appId\": \"test\", \"userId\": \"2\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:55:13+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 2}}, \"packageId\": \"1651157712443_4246950\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:55:13+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (84, '_user_app', 74, '{\"id\": 74, \"appId\": \"test\", \"userId\": \"0\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:56:34+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 0}}, \"packageId\": \"1651157794084_6661417\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:56:34+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (85, '_user_app', 75, '{\"id\": 75, \"appId\": \"test\", \"userId\": \"1\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:56:35+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 1}}, \"packageId\": \"1651157795032_1407826\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:56:35+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (86, '_user_app', 76, '{\"id\": 76, \"appId\": \"test\", \"userId\": \"2\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:56:36+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 2}}, \"packageId\": \"1651157796066_2014709\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:56:36+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (87, '_user_app', 77, '{\"id\": 77, \"appId\": \"test\", \"userId\": \"0\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:57:51+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 0}}, \"packageId\": \"1651157870481_1980800\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:57:51+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (88, '_user_app', 78, '{\"id\": 78, \"appId\": \"test\", \"userId\": \"1\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:57:52+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 1}}, \"packageId\": \"1651157871948_8899809\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:57:52+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (89, '_user_app', 79, '{\"id\": 79, \"appId\": \"test\", \"userId\": \"2\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:57:53+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": 2}}, \"packageId\": \"1651157873133_9808461\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:57:53+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (90, '_user_app', 80, '{\"id\": 80, \"appId\": \"test\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:58:44+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"admin\"}}, \"packageId\": \"1651157923250_5487252\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:58:44+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (91, '_user_app', 81, '{\"id\": 81, \"appId\": \"test\", \"userId\": \"G00001\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:58:46+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"G00001\"}}, \"packageId\": \"1651157925486_5768687\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:58:46+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (92, '_user_app', 82, '{\"id\": 82, \"appId\": \"test\", \"userId\": \"G00002\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T22:58:48+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"G00002\"}}, \"packageId\": \"1651157927439_6462387\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:58:48+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (93, '_user_app', 83, '{\"id\": 83, \"appId\": \"user_app_management\", \"userId\": \"U223P\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T23:04:25+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"user_app_management\", \"userId\": \"U223P\"}}, \"packageId\": \"1651158264819_3408327\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:04:25+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (94, '_user_app', 84, '{\"id\": 84, \"appId\": \"data_repository\", \"userId\": \"U223P\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T23:04:36+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"data_repository\", \"userId\": \"U223P\"}}, \"packageId\": \"1651158275341_3236698\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:04:36+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (95, '_user_app', 85, '{\"id\": 85, \"appId\": \"directory\", \"userId\": \"U223P\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T23:04:37+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"directory\", \"userId\": \"U223P\"}}, \"packageId\": \"1651158276425_1420437\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:04:37+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (96, '_user_app', 85, '{\"id\": 85, \"appId\": \"directory\", \"userId\": \"U223P\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T23:05:18+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"id\": 85}, \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651158317828_5574874\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T23:05:18+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (97, '_user_app', 84, '{\"id\": 84, \"appId\": \"data_repository\", \"userId\": \"U223P\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T23:05:27+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"id\": 84}, \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651158326502_8604676\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T23:05:27+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (98, '_user_app', 81, '{\"id\": 81, \"appId\": \"test\", \"userId\": \"G00001\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T23:05:44+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"G00001\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651158343596_4521906\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T23:05:44+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (99, '_user_app', 82, '{\"id\": 82, \"appId\": \"test\", \"userId\": \"G00002\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-04-28T23:05:47+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"G00002\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651158347031_3376507\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-04-28T23:05:47+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (100, '_user_app', 86, '{\"id\": 86, \"appId\": \"test\", \"userId\": \"G00002\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T23:05:54+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"G00002\"}}, \"packageId\": \"1651158353376_1473571\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:05:54+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (101, '_user_app', 87, '{\"id\": 87, \"appId\": \"test\", \"userId\": \"H00001\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T23:05:55+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"H00001\"}}, \"packageId\": \"1651158354376_2467816\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:05:55+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (102, '_user_app', 88, '{\"id\": 88, \"appId\": \"demo_xiaoapp\", \"userId\": \"admin\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-04-28T23:26:04+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"demo_xiaoapp\", \"userId\": \"admin\"}}, \"packageId\": \"1651159564439_1702073\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:26:04+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (103, '_user_app', 41, '{\"id\": 41, \"appId\": \"data_repository\", \"userId\": \"W00002\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-05-02T15:37:50+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"W00002\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651477070329_3181520\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-05-02T15:37:50+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (104, '_user_app', 42, '{\"id\": 42, \"appId\": \"directory\", \"userId\": \"W00002\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-05-02T15:37:50+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"W00002\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651477070329_3181520\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-05-02T15:37:50+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (105, '_user_app', 46, '{\"id\": 46, \"appId\": \"user_app_management\", \"userId\": \"W00002\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-05-02T15:37:50+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"W00002\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651477070329_3181520\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-05-02T15:37:50+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (106, '_user_app', 54, '{\"id\": 54, \"appId\": \"test\", \"userId\": \"W00002\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-05-02T15:37:50+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"userId\": \"W00002\"}, \"pageId\": \"userManagementOfOneApp\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651477070329_3181520\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-05-02T15:37:50+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (107, '_user_session', 14, '{\"id\": 14, \"userId\": \"admin\", \"userIp\": \"127.0.0.1\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_0dbc1538_chrome\", \"authToken\": \"kWi_S2bbrX9kaaueYZ2KOaLGDiZk526Ydk0C\", \"operation\": \"jhUpdate\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"deviceType\": \"web\", \"operationAt\": \"2022-05-03T16:00:05+08:00\", \"socketStatus\": \"offline\", \"userIpRegion\": \"\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"login\", \"actionId\": \"passwordLogin\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"userId\": \"admin\", \"deviceId\": \"127.0.0.1:7006_Windows.10.0_0dbc1538_chrome\", \"password\": \"123456\"}}, \"packageId\": \"1651564805152_8014039\", \"packageType\": \"httpRequest\"}', 'jhUpdate', 'admin', '系统管理员', '2022-05-03T16:00:05+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (108, '_app', 20, '{\"id\": 20, \"sort\": null, \"appId\": null, \"appUrl\": null, \"appDesc\": null, \"appMenu\": null, \"appName\": \"123\", \"appType\": \"internal\", \"appGroup\": null, \"operation\": \"jhInsert\", \"operationAt\": \"2022-05-03T16:21:36+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagement\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appName\": \"123\"}}, \"packageId\": \"1651566095780_9918311\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-05-03T16:21:36+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (109, '_user_app', 53, '{\"id\": 53, \"appId\": \"test\", \"userId\": \"U223P\", \"operation\": \"jhDelete\", \"operationAt\": \"2022-05-03T16:26:09+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"where\": {\"id\": 53}, \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"deleteItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {}}, \"packageId\": \"1651566368758_6143582\", \"packageType\": \"httpRequest\"}', 'jhDelete', 'admin', '系统管理员', '2022-05-03T16:26:09+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (110, '_user_app', 89, '{\"id\": 89, \"appId\": \"test\", \"userId\": \"U223P\", \"operation\": \"jhInsert\", \"operationAt\": \"2022-05-03T16:26:16+08:00\", \"operationByUser\": \"系统管理员\", \"operationByUserId\": \"admin\"}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"appManagementOfOneUser\", \"actionId\": \"insertItem\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\", \"actionData\": {\"appId\": \"test\", \"userId\": \"U223P\"}}, \"packageId\": \"1651566376246_7509936\", \"packageType\": \"httpRequest\"}', 'jhInsert', 'admin', '系统管理员', '2022-05-03T16:26:16+08:00');
INSERT INTO `_record_history` (`id`, `table`, `recordId`, `recordContent`, `packageContent`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (111, '_user_session', 16, '{\"id\": 16, \"userId\": \"admin\", \"userIp\": \"127.0.0.1\", \"deviceId\": \"127.0.0.1:7006_Mac.10.15.7_78fd27ee_chrome\", \"authToken\": \"1fR8sNQlSCqIKTuodOcbrkbiDwlcq6R4O7Bj\", \"operation\": \"jhInsert\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"deviceType\": \"web\", \"operationAt\": \"2022-08-25T22:16:35+08:00\", \"socketStatus\": \"offline\", \"userIpRegion\": \"\", \"operationByUser\": null, \"operationByUserId\": null}', '{\"appData\": {\"appId\": \"user_app_management\", \"pageId\": \"login\", \"actionId\": \"passwordLogin\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"actionData\": {\"userId\": \"admin\", \"deviceId\": \"127.0.0.1:7006_Mac.10.15.7_78fd27ee_chrome\", \"password\": \"123456\"}}, \"packageId\": \"1661436994488_4741297\", \"packageType\": \"httpRequest\"}', 'jhInsert', NULL, NULL, '2022-08-25T22:16:35+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _resource
-- ----------------------------
DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COLLATE utf8mb4_bin COMMENT '[ "before": {"service": "xx", "serviceFunction": "xxx"}, "after": [] }',
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COLLATE utf8mb4_bin COMMENT 'appData 参数校验',
  `resourceData` text COLLATE utf8mb4_bin COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COLLATE utf8mb4_bin COMMENT '请求Demo',
  `responseDemo` text COLLATE utf8mb4_bin COMMENT '响应Demo',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';

-- ----------------------------
-- Records of _resource
-- ----------------------------
BEGIN;
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (231, NULL, NULL, 'login', 'passwordLogin', '✅登陆', 'service', '{}', '{ \"service\": \"user\", \"serviceFunction\": \"passwordLogin\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (251, NULL, NULL, 'allPage', 'logout', '✅登出', 'service', '{}', '{ \"service\": \"user\", \"serviceFunction\": \"logout\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (253, NULL, NULL, 'allPage', 'userInfo', '✅获取用户信息', 'service', '{}', '{ \"service\": \"user\", \"serviceFunction\": \"userInfo\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (312, NULL, NULL, 'userManagement', 'insertItem', '✅用户管理页-创建用户', 'service', '{}', '{ \"service\": \"userManagement\", \"serviceFunction\": \"addUser\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (313, NULL, NULL, 'userManagement', 'updateItem', '✅用户管理页-修改用户信息', 'sql', '{}', '{ \"table\": \"_user\", \"operation\": \"update\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (314, NULL, NULL, 'userManagement', 'selectItemList', '✅用户管理页-查询用户列表', 'sql', '{}', '{ \"table\": \"_user\", \"operation\": \"select\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (315, NULL, NULL, 'userManagement', 'resetUserPassword', '✅用户管理页-修改用户密码', 'service', '{}', '{ \"service\": \"userManagement\", \"serviceFunction\": \"resetUserPassword\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (317, NULL, NULL, 'appManagement', 'selectItemList', '✅APP管理-查询APP列表', 'sql', '{}', '{ \"table\": \"_app\", \"operation\": \"select\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (318, NULL, NULL, 'appManagement', 'updateItem', '✅APP管理-更新', 'sql', '{}', '{ \"table\": \"_app\", \"operation\": \"jhUpdate\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (319, NULL, NULL, 'appManagement', 'insertItem', '✅APP管理-创建APP', 'sql', '{}', '{ \"table\": \"_app\", \"operation\": \"jhInsert\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (320, NULL, NULL, 'appManagement', 'deleteItem', '✅APP管理-删除APP', 'sql', '{}', '{ \"table\": \"_app\", \"operation\": \"jhDelete\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (361, NULL, NULL, 'appManagementOfOneUser', 'selectItemList', '✅用户的App权限管理-查询列表', 'sql', '{}', '{ \"table\": \"_view02_user_app\", \"operation\": \"select\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (362, NULL, NULL, 'appManagementOfOneUser', 'insertItem', '✅用户的App权限管理-添加', 'sql', '{}', '{ \"table\": \"_user_app\", \"operation\": \"jhInsert\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (363, NULL, NULL, 'appManagementOfOneUser', 'deleteItem', '✅用户的App权限管理-删除', 'sql', '{}', '{ \"table\": \"_user_app\", \"operation\": \"jhDelete\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (364, NULL, '', 'appManagementOfOneUser', 'selectAppItemList', '✅用户的App权限管理-查询APP列表', 'sql', '{}', '{ \"table\": \"_app\", \"operation\": \"select\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (371, NULL, NULL, 'userManagementOfOneApp', 'selectItemList', '✅App的用户权限管理-查询列表', 'sql', '{}', '{ \"table\": \"_view02_user_app\", \"operation\": \"select\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (372, NULL, NULL, 'userManagementOfOneApp', 'insertItem', '✅App的用户权限管理-添加', 'sql', '{}', '{ \"table\": \"_user_app\", \"operation\": \"jhInsert\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (373, NULL, NULL, 'userManagementOfOneApp', 'deleteItem', '✅App的用户权限管理-删除', 'sql', '{}', '{ \"table\": \"_user_app\", \"operation\": \"jhDelete\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (374, NULL, '', 'userManagementOfOneApp', 'selectAppItemList', '✅App的用户权限管理-查询APP列表', 'sql', '{}', '{ \"table\": \"_user\", \"operation\": \"select\" }', NULL, NULL, 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _resource_request_log
-- ----------------------------
DROP TABLE IF EXISTS `_resource_request_log`;
CREATE TABLE `_resource_request_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'resource id;',
  `packageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'resource package id',
  `userIp` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ip;',
  `userAgent` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备信息',
  `userId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备id',
  `userIpRegion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户Ip区域',
  `executeSql` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行的sql',
  `requestBody` json DEFAULT NULL COMMENT '请求body',
  `responseBody` json DEFAULT NULL COMMENT '响应body',
  `responseStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行的结果;  success, fail',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `resourceId_index` (`resourceId`) USING BTREE,
  KEY `packageId_index` (`packageId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件表; 软删除未启用;';


-- ----------------------------
-- Table structure for _role
-- ----------------------------
DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'roleId',
  `roleName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'role name',
  `roleDesc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'role desc',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色表; 软删除未启用;';

-- ----------------------------
-- Records of _role
-- ----------------------------
BEGIN;
INSERT INTO `_role` (`id`, `roleId`, `roleName`, `roleDesc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 'appAdmin', '系统管理员', '', 'insert', NULL, NULL, NULL);
INSERT INTO `_role` (`id`, `roleId`, `roleName`, `roleDesc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, 'boss', '掌门', '', 'insert', NULL, NULL, NULL);
INSERT INTO `_role` (`id`, `roleId`, `roleName`, `roleDesc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (7, 'disciple', '门徒', '', 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _ui
-- ----------------------------
DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COLLATE utf8mb4_bin COMMENT 'ui 动作数据',
  `appDataSchema` json DEFAULT NULL COMMENT 'ui 校验数据',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ui 施工方案';

-- ----------------------------
-- Records of _ui
-- ----------------------------
BEGIN;
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'userManagement', 'ui', 'refreshTableData', '✅获取表格数据', '{\"main\": [{\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 'userManagement', 'ui', 'startCreateItem', '✅打开创建数据抽屉', '{\"main\": [{\"function\": \"clearItemData\"}, {\"function\": \"openCreateItemDialog\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 'userManagement', 'ui', 'createItem', '✅创建数据', '{\"before\": [{\"function\": \"prepareValidate\"}, {\"function\": \"confirmCreateItemDialog\"}], \"main\": [{\"function\": \"doCreateItem\"}, {\"function\": \"refreshTableData\"}], \"after\": [{\"function\": \"closeDrawerShow\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (4, 'userManagement', 'ui', 'startUpdateItem', '✅打开更新数据抽屉', '{\"main\": [{\"function\": \"prepareItemData\"}, {\"function\": \"openUpdateItemDialog\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (5, 'userManagement', 'ui', 'updateItem', '✅更新数据', '{\"before\": [{\"function\": \"prepareValidate\"}, {\"function\": \"confirmUpdateItemDialog\"}], \"main\": [{\"function\": \"doUpdateItem\"}, {\"function\": \"refreshTableData\"}], \"after\": [{\"function\": \"closeDrawerShow\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, 'userManagement', 'ui', 'activeUserStatus', '✅激活用户', '{\"before\": [{\"function\": \"confirmActiveUserStatusDialog\"}], \"main\": [{\"function\": \"prepareItemData\"}, {\"function\": \"doActiveUserStatus\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (7, 'userManagement', 'ui', 'startResetPassword', '✅打开重置密码抽屉', '{\"main\": [{\"function\": \"prepareItemData\"}, {\"function\": \"openResetUserPasswordDialog\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (8, 'userManagement', 'ui', 'resetUserPassword', '✅更新数据', '{\"before\": [{\"function\": \"confirmResetUserPasswordDialog\"}], \"main\": [{\"function\": \"doResetUserPassword\"}, {\"function\": \"refreshTableData\"}], \"after\": [{\"function\": \"closeDrawerShow\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (9, 'userManagement', 'ui', 'bannedUserStatus', '✅禁用用户', '{\"before\": [{\"function\": \"confirmBannedUserStatusDialog\"}], \"main\": [{\"function\": \"prepareItemData\"}, {\"function\": \"doBannedUserStatus\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (10, 'appManagement', 'ui', 'refreshTableData', '✅获取表格数据', '{\"main\": [{\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (12, 'appManagement', 'ui', 'startCreateItem', '✅打开创建数据抽屉', '{\"main\": [{\"function\": \"clearItemData\"}, {\"function\": \"openCreateItemDialog\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (13, 'appManagement', 'ui', 'createItem', '✅创建数据', '{\"before\": [{\"function\": \"prepareValidate\"}, {\"function\": \"confirmCreateItemDialog\"}], \"main\": [{\"function\": \"doCreateItem\"}, {\"function\": \"refreshTableData\"}], \"after\": [{\"function\": \"closeDrawerShow\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (14, 'appManagement', 'ui', 'startUpdateItem', '✅打开更新数据抽屉', '{\"main\": [{\"function\": \"prepareItemData\"}, {\"function\": \"openUpdateDialog\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (15, 'appManagement', 'ui', 'updateItem', '✅更新数据', '{\"before\": [{\"function\": \"prepareValidate\"}, {\"function\": \"confirmUpdateItemDialog\"}], \"main\": [{\"function\": \"doUpdateItem\"}, {\"function\": \"refreshTableData\"}], \"after\": [{\"function\": \"closeDrawerShow\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (16, 'appManagement', 'ui', 'deleteItem', '✅删除数据', '{\"before\": [{\"function\": \"confirmDeleteItemDialog\"}], \"main\": [{\"function\": \"prepareItemData\"}, {\"function\": \"doDeleteItem\"}, {\"function\": \"doDeleteStudentClass\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (20, 'userManagementOfOneApp', 'ui', 'refreshTableData', '✅获取表格数据', '{\"main\": [{\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (21, 'userManagementOfOneApp', 'ui', 'getDrawerTableData', '✅获取内列表数据', '{\"main\": [{\"function\": \"getDrawerTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (24, 'userManagementOfOneApp', 'ui', 'allotUser', '✅同步数据', '{\"before\": [{\"function\": \"confirmAllotUserDialog\"}], \"main\": [{\"function\": \"doAllotUser\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (26, 'userManagementOfOneApp', 'ui', 'buildRelation', '✅同步数据', '{\"before\": [{\"function\": \"confirmAllotUserDialog\"}], \"main\": [{\"function\": \"doBuildRelation\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (27, 'userManagementOfOneApp', 'ui', 'deleteRelation', '✅删除数据', '{\"before\": [{\"function\": \"confirmDeleteUserDialog\"}], \"main\": [{\"function\": \"doDeleteRelation\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (30, 'appManagementOfOneUser', 'ui', 'refreshTableData', '✅获取表格数据', '{\"main\": [{\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (31, 'appManagementOfOneUser', 'ui', 'getDrawerTableData', '✅获取内列表数据', '{\"main\": [{\"function\": \"getDrawerTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (32, 'appManagementOfOneUser', 'ui', 'allotApp', '✅同步数据', '{\"before\": [{\"function\": \"confirmAllotAppDialog\"}], \"main\": [{\"function\": \"doAllotApp\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (33, 'appManagementOfOneUser', 'ui', 'buildRelation', '✅同步数据', '{\"before\": [{\"function\": \"confirmAllotAppDialog\"}], \"main\": [{\"function\": \"doBuildRelation\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_ui` (`id`, `pageId`, `uiActionType`, `uiActionId`, `desc`, `uiActionConfig`, `appDataSchema`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (34, 'appManagementOfOneUser', 'ui', 'deleteRelation', '✅删除数据', '{\"before\": [{\"function\": \"confirmDeleteAppDialog\"}], \"main\": [{\"function\": \"doDeleteRelation\"}, {\"function\": \"refreshTableData\"}]}', NULL, 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _user
-- ----------------------------
DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '自增id; 用于生成userId',
  `userId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名(登陆)',
  `clearTextPassword` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '明文密码',
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `md5Salt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'md5Salt',
  `userStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT 'active' COMMENT '用户账号状态：活跃或关闭',
  `userType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户类型; staff, student.',
  `userConfig` text COLLATE utf8mb4_bin COMMENT '配置信息',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE,
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

-- ----------------------------
-- Records of _user
-- ----------------------------
BEGIN;
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (42, '111', 'admin', '系统管理员', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', 'common', NULL, 'update', NULL, NULL, '2022-02-19T15:02:24+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (43, NULL, 'W00001', '张三丰', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'update', 'admin', '系统管理员', '2022-02-19T15:18:42+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (44, NULL, 'W00002', '张无忌', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'update', 'admin', '系统管理员', '2022-02-19T15:45:14+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (45, NULL, 'G00001', '洪七公', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (46, NULL, 'G00002', '郭靖', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'update', 'admin', '系统管理员', '2022-05-03T13:45:14+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (47, NULL, 'H00001', '岳不群', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (48, NULL, 'H00002', '令狐冲', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'insert', NULL, NULL, NULL);
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `userConfig`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (58, '112', 'U223P', 'uiaction123', '12345678', '31166f44402dedbf27c9b2d4bcfa90cb', 'ajGTYtmy4cNH', 'active', 'common', NULL, 'update', 'admin', '系统管理员', '2022-05-03T16:00:16+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _user_app
-- ----------------------------
DROP TABLE IF EXISTS `_user_app`;
CREATE TABLE `_user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id',
  `appId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'appId',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of _user_app
-- ----------------------------
BEGIN;
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (55, 'W00001', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:18:16+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (56, 'U223P', 'demo_xiaoapp', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:34:42+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (62, 'admin', 'data_repository', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (63, 'admin', 'directory', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (64, 'admin', 'user_app_management', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (68, '0', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:53:46+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (69, '1', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:53:47+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (70, '2', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:53:49+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (71, '0', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:55:10+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (72, '1', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:55:12+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (73, '2', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:55:13+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (74, '0', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:56:34+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (75, '1', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:56:35+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (76, '2', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:56:36+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (77, '0', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:57:51+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (78, '1', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:57:52+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (79, '2', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:57:53+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (80, 'admin', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T22:58:44+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (83, 'U223P', 'user_app_management', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:04:25+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (86, 'G00002', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:05:54+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (87, 'H00001', 'test', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:05:55+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (88, 'admin', 'demo_xiaoapp', 'jhInsert', 'admin', '系统管理员', '2022-04-28T23:26:04+08:00');
INSERT INTO `_user_app` (`id`, `userId`, `appId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (89, 'U223P', 'test', 'jhInsert', 'admin', '系统管理员', '2022-05-03T16:26:16+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _user_group_role
-- ----------------------------
DROP TABLE IF EXISTS `_user_group_role`;
CREATE TABLE `_user_group_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '用户id',
  `groupId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '群组Id',
  `roleId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色Id',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户群组角色关联表; 软删除未启用;';

-- ----------------------------
-- Records of _user_group_role
-- ----------------------------
BEGIN;
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (568, 'admin', 'adminGroup', 'appAdmin', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (569, 'W00001', 'wudang', 'boss', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (570, 'W00002', 'wudang', 'disciple', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (573, 'G00001', 'gaibang', 'boss', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (574, 'G00002', 'gaibang', 'disciple', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (577, 'H00001', 'huashan', 'boss', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (578, 'H00002', 'huashan', 'disciple', 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _user_group_role_page
-- ----------------------------
DROP TABLE IF EXISTS `_user_group_role_page`;
CREATE TABLE `_user_group_role_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `page` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'pageId id',
  `allowOrDeny` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户群组角色 - 页面 映射表; 软删除未启用;';

-- ----------------------------
-- Records of _user_group_role_page
-- ----------------------------
BEGIN;
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (17, '*', 'public', '*', 'login', 'allow', '登陆页; 开放给所有用户;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (18, '*', 'login', '*', 'manual', 'allow', '操作手册页; 开放给登陆用户;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (19, '*', 'login', '*', 'help', 'allow', '帮助页; 开放给登陆用户;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (21, '*', 'adminGroup', 'appAdmin', '*', 'allow', '所有页面; 开放给应用管理者;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (27, '*', 'wudang', 'boss,disciple', 'studentManagement01', 'allow', 'studentManagement01; 开放给武当派派掌门&门徒;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (28, '*', 'gaibang', 'boss,disciple', 'studentManagement02,studentManagement03', 'allow', 'studentManagement02&studentManagement03; 开放给丐帮掌门&门徒;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (29, '*', 'huashan', 'boss,disciple', 'studentManagement04', 'allow', 'studentManagement04; 开放给华山派掌门&门徒;', 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _user_group_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `_user_group_role_resource`;
CREATE TABLE `_user_group_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `resource` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'resourceId 或者 通配符; 通配符: *, !resourceId',
  `allowOrDeny` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户群组角色 - 请求资源 映射表; 软删除未启用;';

-- ----------------------------
-- Records of _user_group_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, '*', 'public', '*', 'login.passwordLogin', 'allow', '登陆resource, 开放给所有用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (11, '*', 'public', '*', 'allPage.getConstantList', 'allow', '查询常量resource, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (31, '*', 'login', '*', 'allPage.logout', 'allow', '登出resource, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (32, '*', 'login', '*', 'allPage.refreshToken', 'allow', '刷新authToken resource, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (33, '*', 'login', '*', 'allPage.userInfo', 'allow', '用户个人信息resource, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (34, '*', 'login', '*', 'allPage.uploadByBase64', 'allow', '上传文件resource, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (35, '*', 'login', '*', 'allPage.uploadByStream', 'allow', '上传文件resource, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (51, '*', 'adminGroup', 'appAdmin', '*', 'allow', '应用管理者, 赋予所有resource权限', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (117, '*', 'wudang', 'boss', 'studentManagement01.*', 'allow', 'page01 内的所有操作; 开放给武当派掌门;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (118, '*', 'wudang', 'disciple', 'studentManagement01.selectItemList', 'allow', 'page01 内的查询列表操作; 开放给武当派门徒;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (125, '*', 'gaibang', 'boss', 'studentManagement02.*,studentManagement03.*', 'allow', 'page02&page03 内的所有操作; 开放给丐帮掌门&门徒;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (126, '*', 'gaibang', 'disciple', 'studentManagement02.selectItemList,studentManagement03.selectItemList', 'allow', 'page02&page03 内的查询列表操作; 开放给丐帮掌门&门徒;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (131, '*', 'huashan', 'boss', 'studentManagement04.*', 'allow', 'page04 内的所有操作; 开放给华山派掌门&门徒;', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (132, '*', 'huashan', 'disciple', 'studentManagement04.selectItemList', 'allow', 'page04 内的查询列表操作; 开放给华山派掌门&门徒;', 'insert', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for _user_session
-- ----------------------------
DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户ip',
  `userIpRegion` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户Ip区域',
  `userAgent` text CHARACTER SET utf8mb4 COMMENT '请求的 agent',
  `deviceId` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) CHARACTER SET utf8mb4 DEFAULT 'web' COMMENT '设备类型; flutter, web, bot_databot, bot_chatbot, bot_xiaochengxu',
  `socketStatus` varchar(255) CHARACTER SET utf8mb4 DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'auth token',
  `operation` varchar(255) CHARACTER SET utf8mb4 DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE,
  KEY `userId_deviceId_index` (`userId`,`deviceId`) USING BTREE,
  KEY `authToken_index` (`authToken`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户session表; deviceId 维度;软删除未启用;';

-- ----------------------------
-- Records of _user_session
-- ----------------------------
BEGIN;
INSERT INTO `_user_session` (`id`, `userId`, `userIp`, `userIpRegion`, `userAgent`, `deviceId`, `deviceType`, `socketStatus`, `authToken`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (14, 'admin', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '127.0.0.1:7006_Windows.10.0_0dbc1538_chrome', 'web', 'offline', 'kWi_S2bbrX9kaaueYZ2KOaLGDiZk526Ydk0C', 'jhUpdate', 'admin', '系统管理员', '2022-05-03T16:00:05+08:00');
INSERT INTO `_user_session` (`id`, `userId`, `userIp`, `userIpRegion`, `userAgent`, `deviceId`, `deviceType`, `socketStatus`, `authToken`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (15, 'admin', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0', '127.0.0.1:7006_Windows.10.0_12d2f3c7_firefox', 'web', 'offline', 'xNx55Wf3NaHXRmKxhzaXEikOyAnRFlDPAOGT', 'jhInsert', NULL, NULL, '2022-04-28T22:44:41+08:00');
INSERT INTO `_user_session` (`id`, `userId`, `userIp`, `userIpRegion`, `userAgent`, `deviceId`, `deviceType`, `socketStatus`, `authToken`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (16, 'admin', '127.0.0.1', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', '127.0.0.1:7006_Mac.10.15.7_78fd27ee_chrome', 'web', 'offline', '1fR8sNQlSCqIKTuodOcbrkbiDwlcq6R4O7Bj', 'jhInsert', NULL, NULL, '2022-08-25T22:16:35+08:00');
COMMIT;

-- ----------------------------
-- View structure for _view01_user
-- ----------------------------
DROP VIEW IF EXISTS `_view01_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_view01_user` AS select `_user`.`id` AS `id`,`_user`.`idSequence` AS `idSequence`,`_user`.`userId` AS `userId`,`_user`.`username` AS `username`,`_user`.`clearTextPassword` AS `clearTextPassword`,`_user`.`password` AS `password`,`_user`.`md5Salt` AS `md5Salt`,`_user`.`userStatus` AS `userStatus`,`_user`.`userType` AS `userType`,`_user`.`userConfig` AS `userConfig`,`_user`.`operation` AS `operation`,`_user`.`operationByUserId` AS `operationByUserId`,`_user`.`operationByUser` AS `operationByUser`,`_user`.`operationAt` AS `operationAt` from `_user`;

-- ----------------------------
-- View structure for _view02_user_app
-- ----------------------------
DROP VIEW IF EXISTS `_view02_user_app`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_view02_user_app` AS select `_user_app`.`id` AS `id`,`_app`.`appId` AS `appId`,`_app`.`appName` AS `appName`,`_user`.`userId` AS `userId`,`_user`.`username` AS `username`,`_user`.`userStatus` AS `userStatus`,`_user`.`userType` AS `userType`,`_user_app`.`operation` AS `operation`,`_user_app`.`operationByUserId` AS `operationByUserId`,`_user_app`.`operationByUser` AS `operationByUser`,`_user_app`.`operationAt` AS `operationAt` from ((`_user_app` join `_user` on((`_user_app`.`userId` = `_user`.`userId`))) join `_app` on((`_user_app`.`appId` = `_app`.`appId`)));

SET FOREIGN_KEY_CHECKS = 1;
