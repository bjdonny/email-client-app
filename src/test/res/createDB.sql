drop database if exists emailapp;
create database emailapp;

use emailapp;

drop table if exists emails;
drop table if exists directories;

create table directories (
	id integer primary key AUTO_INCREMENT,
	name varchar(32) default ''
);

create table emails (
	id integer primary key AUTO_INCREMENT,
	msgNumber integer default 0 not null,
	rcvDate timestamp not null,
	directory integer,
	bcc varchar(1000) default '',
	cc varchar(1000) default '',
	fromEmail varchar(32) default '' not null,
	message varchar(1000) default '',
	toEmails varchar(1000) default '',
	replyTo varchar(1000) default '',
	sentDate timestamp not null,
	subject varchar(32) default '',
	attachments varchar(1000) default '',
	foreign key (directory) references directories(id) ON DELETE CASCADE ON UPDATE CASCADE	
);

insert into directories (name) values ('inbox');
insert into directories (name) values ('sent');
insert into directories (name) values ('new');
insert into directories (name) values ('drafts');
insert into directories (name) values ('trash');
insert into directories (name) values ('starred');

insert into emails (msgNumber, rcvDate, directory, bcc, cc, fromEmail, message, toEmails, replyTo, sentDate, subject, attachments) values (1, now(), 1, '', '', 'cs.517.send@gmail.com', 'plain text', 'cs.517.receive@gmail.com', '', '2016-09-18 01:28:00', 'important', ''),
(2, now(), 1, '', '', 'cs.517.send@gmail.com', 'plain text2', 'cs.517.receive@gmail.com', '', '2016-09-18 01:28:01', 'important2', ''),
(3, now(), 1, '', 'cs.517.send@outlook.com,cs.517.send@gmail.com', 'cs.517.send@gmail.com', 'plain text3', 'cs.517.receive@gmail.com', '', '2016-09-18 01:28:01', 'important3', ''),
(4, now(), 2, '', '', 'cs.517.receive@gmail.com', 'plain text4', 'cs.517.send@gmail.com', '', '2016-09-18 01:28:01', 'important4', ''),
(5, now(), 5, '', '', 'cs.517.receive@gmail.com', 'plain text5', 'cs.517.send@gmail.com', '', '2016-09-18 01:28:01', 'important5', ''),
(6, now(), 2, '', '', 'cs.517.receive@gmail.com', '<html><body><h2>not plain</h2><img src="cid:c.jpg"/><body></html>', 'cs.517.send@gmail.com', '', '2016-09-18 01:28:01', 'important4', '');


