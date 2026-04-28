/*
 Navicat Premium Data Transfer

 Source Server         : Work
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : petadoption

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 08/06/2025 10:45:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `adminId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `adminAccount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminPassword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminAge` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminSex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminTelephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminEmail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin1234', '123456', '管理员', '18', '女', '12312312345', '123@qq.com');

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply`  (
  `applyId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applyUserName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyPetName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyUserSex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyUserAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyUserTelephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyUserState` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyState` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyUserId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `applyPetId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`applyId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_apply
-- ----------------------------
INSERT INTO `t_apply` VALUES ('2169e354-fcf4-4cc2-9a09-c7f8b62b14b7', '张三', '花花', '女', '湖北省武汉市', '1231231234', '无领养经历', '2025-04-16 18:25:23', '不同意领养', '74c4fd99-eb7a-426d-9e87-21cd083e2399', 'pet002');
INSERT INTO `t_apply` VALUES ('2171', '闵丹丹', '叮当', '女', '湖北省武汉市', '1231231234', '无领养经历', '2025-06-08 08:50:14', '同意领养', '76', 'pet001');
INSERT INTO `t_apply` VALUES ('2172', '黄瑞雨', '悠悠', '女', '湖北省武汉市', '1231231234', '无领养经历', '2025-06-08 09:31:45', '同意领养', '77', 'pet007');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` int NOT NULL,
  `aid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adminAction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `object` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `createTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (0, '管理员', '不同意', '张三', '2025-06-08 09:08:00', '/Apply/disagreePage');

-- ----------------------------
-- Table structure for t_pet
-- ----------------------------
DROP TABLE IF EXISTS `t_pet`;
CREATE TABLE `t_pet`  (
  `petId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `petName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petSex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petSub` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petBir` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petDetail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petPic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petState` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`petId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pet
-- ----------------------------
INSERT INTO `t_pet` VALUES ('pet001', '叮当', '母', '猫类', '奶牛猫', '2023-04-04', '2岁奶牛猫，活泼可爱', '/img/slider/nainiumao.jpg', '已被领养');
INSERT INTO `t_pet` VALUES ('pet002', '花花', '母', '猫类', '狸花猫', '2022-04-04', '3岁狸花猫，机敏灵活', '/img/slider/lihuamao.jpg', '已被领养');
INSERT INTO `t_pet` VALUES ('pet003', '笑笑', '母', '猫类', '三花猫', '2023-04-04', '2岁三花猫，温顺亲人', '/petImages/sanhuamao.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet004', '暖暖', '母', '猫类', '高地猫', '2023-05-01', '性格温顺，毛发蓬松柔软的高地猫', '/img/slider/gaodi1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet005', '萌萌', '母', '猫类', '高地猫', '2023-05-05', '爱撒娇，颜值超高的高地猫宝贝', '/img/slider/gaodi2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet006', '乐乐', '母', '猫类', '高地猫', '2023-05-10', '亲人可爱，喜欢钻被窝的高地猫', '/img/slider/gaodi3.jpg', '已被领养');
INSERT INTO `t_pet` VALUES ('pet007', '悠悠', '公', '猫类', '波斯猫', '2023-06-08', '优雅迷人，叫声轻柔的波斯猫', '/img/slider/bosi1.jpg', '已被领养');
INSERT INTO `t_pet` VALUES ('pet008', '可可', '母', '猫类', '布偶猫', '2023-07-12', '长相甜美，性格温柔的布偶猫', '/img/slider/buou1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet009', '糖糖', '母', '猫类', '布偶猫', '2023-07-15', '眼睛湛蓝，喜欢蹭人的布偶猫萌宝', '/img/slider/buou2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet010', '灰灰', '公', '猫类', '俄罗斯蓝猫', '2023-08-20', '身姿矫健，性格独立的俄罗斯蓝猫', '/img/slider/eluosi.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet011', '咪咪', '母', '猫类', '橘猫', '2023-01-01', '活泼可爱，喜欢玩毛线球', '/img/slider/橘猫.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet012', '布丁', '公', '猫类', '橘猫', '2023-03-15', '性格温顺，爱睡觉', '/img/slider/橘猫1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet013', '花花', '母', '猫类', '橘猫', '2023-05-10', '好奇心强，喜欢探索新地方', '/img/slider/橘猫2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet014', '大白', '公', '猫类', '橘猫', '2023-07-20', '颜值高，很粘人', '/img/slider/橘猫3.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet015', '小灰', '公', '猫类', '俄罗斯蓝猫', '2023-08-20', '聪明伶俐，叫声好听', '/img/slider/蓝猫.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet016', '七七', '公', '猫类', '俄罗斯蓝猫', '2023-08-20', '体型较大，性格沉稳', '/img/slider/蓝猫1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet017', '快快', '公', '猫类', '俄罗斯蓝猫', '2023-08-20', '毛发柔软，喜欢被抚摸', '/img/slider/蓝猫2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet018', '圈圈', '母', '猫类', '狸猫', '2023-08-20', '毛发卷曲，活泼好动', '/img/slider/狸猫.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet019', '微微', '公', '猫类', '狸猫', '2023-08-20', '适应能力强，喜欢爬高', '/img/slider/狸猫1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet020', '尔尔', '母', '猫类', '狸猫', '2023-08-20', '毛色乌黑发亮，非常机灵', '/img/slider/狸猫2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet021', '天天', '公', '猫类', '狸猫', '2023-08-20', '长相甜美，性格温和', '/img/slider/狸猫3.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet022', '高飞', '公', '猫类', '狸猫', '2023-08-20', '活泼好动，好奇心旺盛', '/img/slider/狸猫4.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet023', '富贵', '公', '猫类', '缅因', '2023-08-20', '体型大，性格温顺', '/img/slider/缅因.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet024', '火箭', '公', '猫类', '缅因', '2023-08-20', '毛色乌黑发亮，非常机灵', '/img/slider/缅因1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet025', '咕咕', '公', '猫类', '暹罗猫', '2023-08-20', '猫中保姆', '/img/slider/暹罗猫.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet026', '六号', '公', '猫类', '暹罗猫', '2023-08-20', '体贴，亲人', '/img/slider/暹罗猫1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet027', '阿娇', '母', '猫类', '暹罗猫', '2023-08-20', '需要很多关爱的猫咪', '/img/slider/暹罗猫2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet028', '奥斯', '母', '猫类', '银渐层短毛', '2023-08-20', '老虎的远方亲戚', '/img/slider/银渐层短毛.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet029', '阿文', '母', '猫类', '银渐层短毛', '2023-08-20', '恶龙咆哮', '/img/slider/银渐层短毛1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet030', '小向', '公', '猫类', '银渐层短毛', '2023-08-20', '可可爱爱', '/img/slider/银渐层短毛2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet031', '小白', '母', '犬类', '比熊犬', '2024-04-04', '1岁比熊犬，毛发蓬松', '/img/slider/bixiong.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet032', '小盾', '公', '犬类', '拉布拉多犬', '2024-04-04', '1岁拉布拉多犬，热情友善', '/img/slider/labuladuo.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet033', '球球', '公', '犬类', '松狮犬', '2024-04-04', '1岁松狮犬，憨态可掬', '/img/slider/songshiquan.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet034', '点点', '公', '犬类', '边境牧羊犬', '2023-03-10', '活泼聪明的边牧幼犬，喜欢追逐玩耍', '/img/slider/bianmu1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet035', '欢欢', '公', '犬类', '边境牧羊犬', '2023-03-15', '精力充沛的边牧宝宝，对新事物充满好奇', '/img/slider/bianmu2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet036', '喜喜', '公', '犬类', '哈士奇', '2023-02-09', '活泼好动，表情丰富的哈士奇', '/img/slider/hashiqi.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet037', '热热', '公', '犬类', '阿拉斯加', '2023-02-09', '忠诚护主，警惕性高', '/img/slider/阿拉斯加.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet038', '乐乐', '公', '犬类', '阿拉斯加', '2023-02-09', '性格温顺，喜欢和人玩耍', '/img/slider/阿拉斯加1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet039', '呆呆', '公', '犬类', '阿拉斯加', '2023-02-09', '工作能力强，常作为警犬', '/img/slider/阿拉斯加2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet040', '哈哈', '公', '犬类', '斑点狗', '2023-02-09', '嗅觉灵敏，常作为猎犬', '/img/slider/斑点狗.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet041', '茂茂', '母', '犬类', '比熊犬', '2024-04-04', '1岁比熊犬，毛发蓬松', '/img/slider/比熊.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet042', '钉钉', '公', '犬类', '柴犬', '2024-04-04', '微笑天使，性格开朗', '/img/slider/柴犬.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet043', '安安', '公', '犬类', '斗牛', '2024-04-04', '1岁松狮犬，憨态可掬', '/img/slider/斗牛.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet044', '生生', '公', '犬类', '斗牛', '2023-03-10', '活泼聪明的边牧幼犬，喜欢追逐玩耍', '/img/slider/斗牛1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet045', '容容', '公', '犬类', '哈士奇', '2023-03-15', '精力充沛的边牧宝宝，对新事物充满好奇', '/img/slider/哈士奇.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet046', '开关', '公', '犬类', '哈士奇', '2023-02-09', '活泼好动，表情丰富的哈士奇', '/img/slider/哈士奇1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet047', '高高', '公', '犬类', '哈士奇', '2023-02-09', '活泼好动，表情丰富的哈士奇', '/img/slider/哈士奇2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet048', '豆腐', '公', '犬类', '吉娃娃', '2023-02-09', '长相甜美，喜欢撒娇', '/img/slider/吉娃娃.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet049', '太阳', '公', '犬类', '金毛', '2023-02-09', '聪明听话，常作为导盲犬', '/img/slider/金毛.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet050', '空卡', '公', '犬类', '金毛', '2023-02-09', '活泼好动，表情丰富的哈士奇', '/img/slider/金毛1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet051', '达菲', '母', '犬类', '拉布拉多', '2024-04-04', '表情丰富，性格独立', '/img/slider/拉布拉多.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet052', '沙沙', '公', '犬类', '萨摩耶', '2024-04-04', '1岁萨摩耶犬，热情友善', '/img/slider/萨摩耶.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet053', '埃斯', '公', '犬类', '泰迪', '2024-04-04', '小短腿，屁股很可爱', '/img/slider/泰迪.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet054', '巴比', '公', '犬类', '泰迪', '2023-03-10', '活泼聪明的边牧幼犬，喜欢追逐玩耍', '/img/slider/泰迪1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet055', '空白', '公', '犬类', '约克夏', '2023-03-15', '聪明可爱，毛发需要经常打理', '/img/slider/约克夏.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet056', '小小', '公', '犬类', '约克夏', '2023-02-09', '体型小巧，警惕性高', '/img/slider/约克夏1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet057', '乖乖', '公', '犬类', '中华田园犬', '2023-02-09', '毛发蓬松，性格憨厚', '/img/slider/中华田园犬.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet058', '毛毛', '公', '犬类', '中华田园犬', '2023-02-09', '性格温和，对人友好', '/img/slider/中华田园犬1.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet059', '壮壮', '公', '犬类', '中华田园犬', '2023-02-09', '活泼好动，表情丰富的哈士奇', '/img/slider/中华田园犬2.jpg', '未领养');
INSERT INTO `t_pet` VALUES ('pet060', '理理', '公', '犬类', '边牧', '2023-02-09', '智商高，善于牧羊', '/img/slider/边牧.jpg', '未领养');

-- ----------------------------
-- Table structure for t_preference
-- ----------------------------
DROP TABLE IF EXISTS `t_preference`;
CREATE TABLE `t_preference`  (
  `preferenceId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `petSub` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `petType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `createTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`preferenceId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `t_preference_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_preference
-- ----------------------------

-- ----------------------------
-- Table structure for t_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend`  (
  `recommendId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `petId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `recommendScore` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `createTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`recommendId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `petId`(`petId` ASC) USING BTREE,
  CONSTRAINT `t_recommend_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_recommend_ibfk_2` FOREIGN KEY (`petId`) REFERENCES `t_pet` (`petId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `userId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userAccount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userPassword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userAge` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userSex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userTelephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userState` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('74c4fd99-eb7a-426d-9e87-21cd083e2399', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', '19', '女', '1231231234', '123@qq.com', '湖北省武汉市', '无领养经历');
INSERT INTO `t_user` VALUES ('76', 'mindandan', '81dc9bdb52d04dc20036dbd8313ed055', '闵丹丹', '20', '女', '1231231234', '123@qq.com', '湖北省武汉市', '有领养经历');
INSERT INTO `t_user` VALUES ('77', 'huangruiyu', '81dc9bdb52d04dc20036dbd8313ed055', '黄瑞雨', '19', '女', '1231231234', '123@qq.com', '湖北省武汉市', '无领养经历');

-- ----------------------------
-- Table structure for t_userlog
-- ----------------------------
DROP TABLE IF EXISTS `t_userlog`;
CREATE TABLE `t_userlog`  (
  `id` int NOT NULL,
  `userId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userAction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `petId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `createTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_userlog
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
