create database restaurants;

use restaurants;

create table user (
id int primary key auto_increment not null,
name varchar(30),
telephone int,
email varchar(40),
created_at datetime default current_timestamp,
update_at datetime default current_timestamp on update current_timestamp
);

create table restaurants (
id int primary key auto_increment not null,
name varchar(40),
email varchar(50),
telephone int
);

create table reservations (
id int primary key auto_increment not null,
restaurants_id int,
foreign key (restaurants_id) references restaurants(id),
user_id int,
foreign key (user_id) references user(id),
status enum('pedning', 'confirmed', 'cancelled'),
date_reservation datetime
);

create table reviews (
id int primary key auto_increment not null,
user_id int,
foreign key (user_id) references user(id),
restaurants_id int,
foreign key (restaurants_id) references restaurants(id),
description text not null, 
stars int not null check (stars >= 1 and stars <= 5),
created_at datetime default current_timestamp
);