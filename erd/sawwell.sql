CREATE TABLE `cust` (
	`custno`	int(10)	NOT NULL,
	`id`	int(10)	NULL,
	`password`	char(30)	NULL,
	`name`	char(10)	NULL,
	`address`	char(100)	NULL,
	`email`	char(100)	NULL,
	`regdate`	DATE	NULL
);test4

CREATE TABLE `market` (
	`marketno`	int(10)	NOT NULL,
	`cid`	int(10)	NOT NULL,
	`foodid`	int(10)	NOT NULL,
	`marketname`	char(100)	NULL,
	`marketaddress`	char(100)	NULL,
	`regdate`	DATE	NULL,
	`openclose`	char(20)	NULL,
	`holiday`	date	NULL,
	`hit`	int(10)	NULL
);

CREATE TABLE `reivew` (
	`reviewno`	int(10)	NOT NULL,
	`marketno`	int(10)	NOT NULL,
	`custno`	int(10)	NOT NULL,
	`content`	int(10)	NULL,
	`star`	float(10)	NULL,
	`regdate`	DATE	NULL
);

CREATE TABLE `categori` (
	`cid`	int(10)	NOT NULL,
	`categoriname`	char(30)	NULL
);

CREATE TABLE `food` (
	`foodid`	int(10)	NOT NULL,
	`name`	char(30)	NULL,
	`price`	int(10)	NULL,
	`regdate`	DATE	NULL
);

CREATE TABLE `ceo` (
	`ceoid`	int(10)	NOT NULL,
	`marketno`	int(10)	NOT NULL,
	`id`	char(100)	NULL,
	`password`	char(100)	NULL,
	`name`	char(100)	NULL
);

CREATE TABLE `reply` (
	`replyid`	int(10)	NOT NULL,
	`reviewno`	int(10)	NOT NULL,
	`ceoid`	int(10)	NOT NULL,
	`content`	char(100)	NULL,
	`regdate`	DATE	NULL
);

ALTER TABLE `market` ADD CONSTRAINT `FK_categori_TO_market_1` FOREIGN KEY (
	`cid`
)
REFERENCES `categori` (
	`cid`
);

ALTER TABLE `market` ADD CONSTRAINT `FK_food_TO_market_1` FOREIGN KEY (
	`foodid`
)
REFERENCES `food` (
	`foodid`
);

ALTER TABLE `reivew` ADD CONSTRAINT `FK_market_TO_reivew_1` FOREIGN KEY (
	`marketno`
)
REFERENCES `market` (
	`marketno`
);

ALTER TABLE `reivew` ADD CONSTRAINT `FK_cust_TO_reivew_1` FOREIGN KEY (
	`custno`
)
REFERENCES `cust` (
	`custno`
);

ALTER TABLE `ceo` ADD CONSTRAINT `FK_market_TO_ceo_1` FOREIGN KEY (
	`marketno`
)
REFERENCES `market` (
	`marketno`
);

ALTER TABLE `reply` ADD CONSTRAINT `FK_reivew_TO_reply_1` FOREIGN KEY (
	`reviewno`
)
REFERENCES `reivew` (
	`reviewno`
);

ALTER TABLE `reply` ADD CONSTRAINT `FK_ceo_TO_reply_1` FOREIGN KEY (
	`ceoid`
)
REFERENCES `ceo` (
	`ceoid`
);