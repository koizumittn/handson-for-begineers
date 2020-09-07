CREATE TABLE shop
(
id INTEGER NOT NULL,
name VARCHAR(100) NOT NULL,
location VARCHAR(100) NOT NULL,
sales INTEGER NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE user
(
id INTEGER NOT NULL,
name VARCHAR(100) NOT NULL,
age INTEGER NOT NULL,
sex VARCHAR(10) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE visit
(
id INTEGER NOT NULL,
shop_id INTEGER NOT NULL,
user_id INTEGER NOT NULL,
rank INTEGER,    
PRIMARY KEY (ID)
);

BEGIN;
    INSERT INTO shop VALUES(1, 'まるちゃんラーメン', '東京', 175);
    INSERT INTO shop VALUES(2, '匠', '東京', 243);
    INSERT INTO shop VALUES(3, 'あじさいラーメン', '東京', 182);
    INSERT INTO shop VALUES(4, '麺屋 奏', '神奈川', 193);
    INSERT INTO shop VALUES(5, 'つけめん 中西', '神奈川', 140);
    INSERT INTO shop VALUES(6, '川崎屋', '神奈川', 164);
    INSERT INTO shop VALUES(7, 'ラーメン食堂', '神奈川', 201);
    INSERT INTO shop VALUES(8, '自家製麺 板倉', '千葉', 135);
    INSERT INTO shop VALUES(9, '大河ラーメン', '千葉', 186);
    INSERT INTO shop VALUES(10, 'RAMEN TETSU', '埼玉', 157);

    INSERT INTO user VALUES(2, '岩本 美則', 37, '男性');
    INSERT INTO user VALUES(1, '小山 眞八', 34, '男性');
    INSERT INTO user VALUES(4, '村上 淳子', 24, '女性');
    INSERT INTO user VALUES(3, '鶴田 咲子', 19, '女性');
    INSERT INTO user VALUES(6, '栗田 幾江', 40, '女性');
    INSERT INTO user VALUES(5, '高島 永基', 22, '男性');
    INSERT INTO user VALUES(8, '本多 美己', 45, '男性');
    INSERT INTO user VALUES(7, '相馬 共成', 22, '男性');
    INSERT INTO user VALUES(10, '浜野 弘義', 31, '男性');
    INSERT INTO user VALUES(9, '吉本 堅次', 17, '男性');
    INSERT INTO user VALUES(12, '上村 暉一郎', 22, '男性');
    INSERT INTO user VALUES(11, '川本 秋代', 23, '女性');
    INSERT INTO user VALUES(14, '西尾 明博', 21, '男性');
    INSERT INTO user VALUES(13, '林 通', 33, '男性');
    INSERT INTO user VALUES(16, '坂口 訓', 37, '男性');
    INSERT INTO user VALUES(15, '荻野 幸美', 25, '女性');
    INSERT INTO user VALUES(18, '小川 れいな', 28, '女性');
    INSERT INTO user VALUES(17, '池田 由水', 18, '女性');
    INSERT INTO user VALUES(20, '小沢 陽子', 32, '女性');
    INSERT INTO user VALUES(19, '大田 なつみ', 40, '女性');

    INSERT INTO visit VALUES(1, 10, 6, 1);
    INSERT INTO visit VALUES(2, 5, 7, 3);
    INSERT INTO visit VALUES(3, 7, 9, 4);
    INSERT INTO visit VALUES(4, 7, 13, 2);
    INSERT INTO visit VALUES(5, 8, 6, 5);
    INSERT INTO visit VALUES(6, 10, 8, 4);
    INSERT INTO visit VALUES(7, 2, 3, 2);
    INSERT INTO visit VALUES(8, 3, 8, 3);
    INSERT INTO visit VALUES(9, 10, 2, 1);
    INSERT INTO visit VALUES(10, 4, 19, 3);
    INSERT INTO visit VALUES(11, 3, 13, 3);
    INSERT INTO visit VALUES(12, 1, 14, 1);
    INSERT INTO visit VALUES(13, 3, 19, 3);
    INSERT INTO visit VALUES(14, 6, 20, 3);
    INSERT INTO visit VALUES(15, 5, 5, 4);
    INSERT INTO visit VALUES(16, 6, 11, 3);
    INSERT INTO visit VALUES(17, 8, 12, 4);
    INSERT INTO visit VALUES(18, 4, 13, 2);
    INSERT INTO visit VALUES(19, 6, 19, 4);
    INSERT INTO visit VALUES(20, 9, 4, 4);
    INSERT INTO visit VALUES(21, 2, 11, 1);
    INSERT INTO visit VALUES(22, 9, 14, 3);
    INSERT INTO visit VALUES(23, 4, 20, 2);
    INSERT INTO visit VALUES(24, 4, 16, 5);
    INSERT INTO visit VALUES(25, 6, 14, 3);
    INSERT INTO visit VALUES(26, 3, 15, 3);
    INSERT INTO visit VALUES(27, 2, 6, 2);
    INSERT INTO visit VALUES(28, 6, 13, 4);
    INSERT INTO visit VALUES(29, 9, 8, 2);
    INSERT INTO visit VALUES(30, 8, 8, 3);
    INSERT INTO visit VALUES(31, 2, 9, 3);
    INSERT INTO visit VALUES(32, 3, 5, 2);
    INSERT INTO visit VALUES(33, 1, 13, 3);
    INSERT INTO visit VALUES(34, 1, 7, 3);
    INSERT INTO visit VALUES(35, 8, 3, 3);
    INSERT INTO visit VALUES(36, 8, 15, 3);
    INSERT INTO visit VALUES(37, 7, 17, 2);
    INSERT INTO visit VALUES(38, 8, 16, 4);
    INSERT INTO visit VALUES(39, 5, 7, 4);
    INSERT INTO visit VALUES(40, 7, 2, 3);
    INSERT INTO visit VALUES(41, 8, 13, 2);
    INSERT INTO visit VALUES(42, 6, 9, 3);
    INSERT INTO visit VALUES(43, 4, 1, 4);
    INSERT INTO visit VALUES(44, 2, 6, 5);
    INSERT INTO visit VALUES(45, 2, 3, 4);
    INSERT INTO visit VALUES(46, 7, 7, 2);
    INSERT INTO visit VALUES(47, 9, 17, 4);
    INSERT INTO visit VALUES(48, 2, 2, 3);
    INSERT INTO visit VALUES(49, 4, 9, 2);
    INSERT INTO visit VALUES(50, 5, 12, 4);
    INSERT INTO visit VALUES(51, 10, 6, 2);
    INSERT INTO visit VALUES(52, 5, 8, 4);
    INSERT INTO visit VALUES(53, 5, 14, 2);
    INSERT INTO visit VALUES(54, 6, 13, 5);
    INSERT INTO visit VALUES(55, 5, 13, 1);
    INSERT INTO visit VALUES(56, 3, 8, 3);
    INSERT INTO visit VALUES(57, 6, 17, 3);
    INSERT INTO visit VALUES(58, 6, 7, 2);
    INSERT INTO visit VALUES(59, 1, 3, 5);
    INSERT INTO visit VALUES(60, 1, 5, 2);
    INSERT INTO visit VALUES(61, 6, 11, 4);
    INSERT INTO visit VALUES(62, 6, 7, 3);
    INSERT INTO visit VALUES(63, 4, 17, 2);
    INSERT INTO visit VALUES(64, 7, 6, 3);
    INSERT INTO visit VALUES(65, 5, 2, 3);
    INSERT INTO visit VALUES(66, 3, 14, 2);
    INSERT INTO visit VALUES(67, 7, 17, 2);
    INSERT INTO visit VALUES(68, 4, 8, 2);
    INSERT INTO visit VALUES(69, 8, 5, 2);
    INSERT INTO visit VALUES(70, 3, 5, 4);
    INSERT INTO visit VALUES(71, 9, 17, 2);
    INSERT INTO visit VALUES(72, 2, 20, 4);
    INSERT INTO visit VALUES(73, 6, 1, 2);
    INSERT INTO visit VALUES(74, 3, 9, 3);
    INSERT INTO visit VALUES(75, 4, 18, 3);
    INSERT INTO visit VALUES(76, 10, 11, 3);
    INSERT INTO visit VALUES(77, 10, 13, 4);
    INSERT INTO visit VALUES(78, 5, 20, 2);
    INSERT INTO visit VALUES(79, 6, 13, 2);
    INSERT INTO visit VALUES(80, 6, 11, 5);
    INSERT INTO visit VALUES(81, 4, 16, 3);
    INSERT INTO visit VALUES(82, 10, 4, 3);
    INSERT INTO visit VALUES(83, 6, 18, 3);
    INSERT INTO visit VALUES(84, 1, 18, 3);
    INSERT INTO visit VALUES(85, 4, 4, 5);
    INSERT INTO visit VALUES(86, 10, 7, 3);
    INSERT INTO visit VALUES(87, 8, 3, 3);
    INSERT INTO visit VALUES(88, 1, 10, 2);
    INSERT INTO visit VALUES(89, 6, 20, 3);
    INSERT INTO visit VALUES(90, 1, 9, 5);
    INSERT INTO visit VALUES(91, 8, 2, 5);
    INSERT INTO visit VALUES(92, 10, 15, 3);
    INSERT INTO visit VALUES(93, 2, 8, 2);
    INSERT INTO visit VALUES(94, 5, 5, 5);
    INSERT INTO visit VALUES(95, 3, 5, 2);
    INSERT INTO visit VALUES(96, 9, 11, 1);
    INSERT INTO visit VALUES(97, 9, 1, 3);
    INSERT INTO visit VALUES(98, 8, 6, 2);
    INSERT INTO visit VALUES(99, 1, 16, 2);
    INSERT INTO visit VALUES(100, 1, 1, 3);

COMMIT;
