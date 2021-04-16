/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : recipe

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2020-06-18 22:26:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administratorinfo`
-- ----------------------------
DROP TABLE IF EXISTS `administratorinfo`;
CREATE TABLE `administratorinfo` (
  `administrator_name` varchar(10) NOT NULL,
  `administrator_password` varchar(20) NOT NULL,
  PRIMARY KEY (`administrator_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administratorinfo
-- ----------------------------
INSERT INTO `administratorinfo` VALUES ('ding', 'ding');
INSERT INTO `administratorinfo` VALUES ('lww', 'lww');

-- ----------------------------
-- Table structure for `commentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `comment_recipe` varchar(30) NOT NULL,
  `comment_number` char(11) NOT NULL,
  `comment_info` varchar(200) NOT NULL,
  PRIMARY KEY (`comment_recipe`,`comment_number`,`comment_info`),
  KEY `comment_number` (`comment_number`),
  CONSTRAINT `commentinfo_ibfk_1` FOREIGN KEY (`comment_recipe`) REFERENCES `recipeinfo` (`recipe_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentinfo_ibfk_2` FOREIGN KEY (`comment_number`) REFERENCES `userinfo` (`user_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------
INSERT INTO `commentinfo` VALUES ('松鼠鱼', '15931570503', '喜欢喜欢');
INSERT INTO `commentinfo` VALUES ('莴笋', '17331230503', '你是傻子吗，滚蛋吧');
INSERT INTO `commentinfo` VALUES ('松鼠鱼', '17331280503', '下次还来');
INSERT INTO `commentinfo` VALUES ('松鼠鱼', '17331280503', '嘿嘿嘿');
INSERT INTO `commentinfo` VALUES ('酱排骨', '17331280503', '嘻嘻嘻');
INSERT INTO `commentinfo` VALUES ('双色鱿鱼卷', '19831159025', '喜欢');
INSERT INTO `commentinfo` VALUES ('松鼠鱼', '19831159025', '好吃');

-- ----------------------------
-- Table structure for `likeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `likeinfo`;
CREATE TABLE `likeinfo` (
  `like_recipe` varchar(30) NOT NULL,
  `like_number` char(11) NOT NULL,
  PRIMARY KEY (`like_recipe`,`like_number`),
  KEY `like_number` (`like_number`),
  CONSTRAINT `likeinfo_ibfk_1` FOREIGN KEY (`like_recipe`) REFERENCES `recipeinfo` (`recipe_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likeinfo_ibfk_2` FOREIGN KEY (`like_number`) REFERENCES `userinfo` (`user_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likeinfo
-- ----------------------------
INSERT INTO `likeinfo` VALUES ('松鼠鱼', '17331280503');
INSERT INTO `likeinfo` VALUES ('莴笋', '17331280503');
INSERT INTO `likeinfo` VALUES ('酱排骨', '17331280503');
INSERT INTO `likeinfo` VALUES ('双色鱿鱼卷', '19831159025');
INSERT INTO `likeinfo` VALUES ('松鼠鱼', '19831159025');

-- ----------------------------
-- Table structure for `recipeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `recipeinfo`;
CREATE TABLE `recipeinfo` (
  `recipe_name` varchar(30) NOT NULL,
  `recipe_type` varchar(10) DEFAULT '',
  `recipe_photo` varchar(100) DEFAULT '',
  `recipe_material` varchar(400) DEFAULT '',
  `recipe_steps` varchar(1500) DEFAULT '',
  `recipe_likenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`recipe_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recipeinfo
-- ----------------------------
INSERT INTO `recipeinfo` VALUES ('双色鱿鱼卷', '鲁菜', 'images\\RecipeImgs\\img1.jpg', '干鱿鱼、水发鱿鱼各300克，青椒块、红椒块、姜汁、蒜汁各适量', '1、将干鱿鱼切丝，水发鱿鱼去头尾，削刀花切块，用加盐、料酒的沸水烫起卷，捞出控水。', '13');
INSERT INTO `recipeinfo` VALUES ('松鼠鱼', '鲁菜', 'images\\RecipeImgs\\img3.jpg', '食盐、白醋、草鱼、白砂糖、番茄酱、干淀粉200克、鸡蛋2个、玉米粒20克、料酒、番茄。', '1、草鱼500克去掉鱼翅，斜向下刀将鱼肉切片，不要切断，反方向纵向下刀将鱼肉切块同样不要切断。', '103');
INSERT INTO `recipeinfo` VALUES ('莴笋', '湘菜', 'images\\RecipeImgs\\img2.jpg', '莴笋200克，豆鼓25克，葱、姜汁各15克，葱花、蒜泥、姜末各少许', '1、将莴笋洗净切菱形片，用少许盐、葱汁、姜汁、料酒、味精拌匀。', '51');
INSERT INTO `recipeinfo` VALUES ('酱排骨', '鲁菜', '', '排骨一斤 黄糖一块 八角一颗 草果一颗 陈皮一片 桂皮、香叶各一片', '1.排骨洗干净，甜面酱一小碗、各种配料准备好', '1');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_number` char(11) NOT NULL,
  `user_name` varchar(50) DEFAULT '',
  `user_password` varchar(50) DEFAULT '',
  `user_sex` char(2) DEFAULT '',
  `user_photo` varchar(100) DEFAULT '',
  `user_hobby` varchar(200) DEFAULT '',
  PRIMARY KEY (`user_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('15931570503', '哈哈哈哈', 'ding', '女', '', '');
INSERT INTO `userinfo` VALUES ('17331230503', '还好', 'ding', '女', '', '');
INSERT INTO `userinfo` VALUES ('17331250503', '好', 'ding', '女', '', '');
INSERT INTO `userinfo` VALUES ('17331280503', '还好', 'ding', '女', 'images\\userImgs\\img1.jpg', '川菜、浙菜、湘菜');
INSERT INTO `userinfo` VALUES ('17331280508', '还好', 'ding', '女', '', '');
INSERT INTO `userinfo` VALUES ('19831159025', '完美', 'ding', '男', 'images\\UserImgs\\img3.jpg', '鲁菜、苏菜、湘菜');
