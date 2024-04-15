CREATE TABLE `user` (
    `id` BIGINT UNSIGNED NOT null AUTO_INCREMENT COMMENT 'ユーザの識別子',
    `name` varchar(20) not null COMMENT 'ユーザ名',
    `password` varchar(80) not null COMMENT 'パスワードハッシュ',
    `role` varchar(80) not null COMMENT 'ロール',
    `created` DATETIME (6) not null COMMENT 'レコード作成日時',
    `modified` DATETIME (6) not null COMMENT 'レコード修正日時',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_name` (`name`) USING BTREE
) Engine = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'ユーザー';

CREATE TABLE `task` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'タスクの識別子',
    `title` VARCHAR(128) NOT NULL COMMENT 'タスクのタイトル',
    `status` VARCHAR(20) NOT NULL COMMENT 'タスクの状態',
    `created` DATETIME (6) not null COMMENT 'レコード作成日時',
    `modified` DATETIME (6) not null COMMENT 'レコード修正日時',
    PRIMARY KEY (`id`)
) Engine = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'タスク';