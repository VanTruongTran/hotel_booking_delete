-- DROP database hotel_booking;

CREATE DATABASE hotel_booking;
USE hotel_booking;
-- -----------------------
DROP TABLE IF EXISTS token_expired;
CREATE TABLE token_expired (
id int NOT NULL AUTO_INCREMENT,
name varchar(1000),
PRIMARY KEY (id));
-- ------------------------
DROP TABLE IF EXISTS contact;
CREATE TABLE contact (
id int NOT NULL AUTO_INCREMENT,
address varchar(100),
email varchar(100),
name varchar(100),
phone varchar(100),
PRIMARY KEY (id));


-- ---------------------------------
DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
id int NOT NULL AUTO_INCREMENT,
role_name varchar(100),
PRIMARY KEY (id));

/*Data for the table roles */
INSERT INTO roles (role_name) VALUES 
('admin'),
('regular');
SELECT * FROM roles;
-- ----------------------------
DROP TABLE IF EXISTS users;
CREATE TABLE users (
id int NOT NULL AUTO_INCREMENT,
full_name varchar(100) DEFAULT NULL,
DOB date DEFAULT NULL,
email varchar(100) DEFAULT NULL,
email_verify boolean DEFAULT true,
password varchar(100) DEFAULT NULL,
phone varchar(100) DEFAULT NULL,
gender varchar(100) DEFAULT NULL,
role_id int,
PRIMARY KEY (id),
FOREIGN KEY (role_id) REFERENCES roles (id)-- ON DELETE CASCADE,
);
SELECT * FROM users;

/*Data for the table users */
INSERT INTO users (full_name, DOB, email, password, phone, gender, role_id) VALUES 
('Nguyen Van A ', '1990-12-12', 'nguyenvanA@gmail.com', '123456', '090123456', 'Male', 1),
('Nguyen Thi B ', '1995-12-03', 'nguyenthiB95@gmail.com', '123457', '090123444', 'Female', 1),
('Nguyen Van C ', '1991-01-10', 'nguyenvanC91@gmail.com', '123458', '090333456', 'Male', 2),
('Nguyen Van D ', '1992-01-15', 'nguyenvanD92@gmail.com', '123459', '090333888', 'Male', 2),
('Nguyen Van E ', '1995-01-15', 'nguyenvanE95@gmail.com', '123450', '090333881', 'Male', 2),
('Nguyen Van F ', '1998-01-15', 'nguyenvanE98@gmail.com', '123453', '090333889', 'Male', 2);
SELECT * FROM users;

-- ----------------------------
DROP TABLE IF EXISTS province;
CREATE TABLE province (
id int NOT NULL AUTO_INCREMENT,
province varchar(255) DEFAULT NULL,
PRIMARY KEY (id));
SELECT * FROM province;

INSERT INTO province (province) VALUES 
('???? N???ng'),
('Qu???ng Nam'),
('Hu???'),
('B??nh ?????nh');
SELECT * FROM province;
-- --------------------
DROP TABLE IF EXISTS city;
CREATE TABLE city (
id int NOT NULL AUTO_INCREMENT,
city varchar(255) DEFAULT NULL,
province_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (province_id) REFERENCES province (id)-- ON DELETE CASCADE,
);
SELECT * FROM city;

INSERT INTO city (city, province_id) VALUES 
('???? N???ng',1),
('Tam K???', 2),
('H???i An', 2),
('Hu???', 3),
('Quy Nh??n',4);
SELECT * FROM city;
-- -------------------------
DROP TABLE IF EXISTS service;
CREATE TABLE service(
id int NOT NULL AUTO_INCREMENT,
service varchar(100) DEFAULT NULL,
PRIMARY KEY (id));
SELECT * FROM service;

INSERT INTO service (service) VALUES 
('pool'),
('breakfast'),
('spa'),
('gym'),
('airport transfer');
SELECT * FROM service;
-- ---------------------
DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
id int NOT NULL AUTO_INCREMENT,
hotel_name varchar(100) DEFAULT NULL,
address varchar(100) DEFAULT NULL,
email varchar(100) DEFAULT NULL,
phone varchar(100) DEFAULT NULL,
hotel_rank int DEFAULT NULL CHECK (hotel_rank >=1 OR hotel_rank <=5),
description varchar(255) DEFAULT NULL,
image text DEFAULT NULL,
city_id int DEFAULT NULL,
-- serviceId int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (city_id) REFERENCES city (id) ON DELETE CASCADE
);
SELECT * FROM hotel;

INSERT INTO hotel (hotel_name, address, email, phone, hotel_rank, description, city_id) VALUES
('HAIAN Beach Hotel & Spa', '278 Vo Nguyen Giap Street, My An Ward, Ngu Hanh Son District, Da Nang', 'haianhotel@gmail.com', '083212234', 5, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Ph?????c M??? part of ???? N???ng, this property puts you close to attractions and interesting dining options.', 1),
('Stella Maris Beach Danang', '03 Vo Van Kiet Street, Phuoc My Ward, Son Tra District, Da Nang' , 'stellahotel@gmail.com', '083123456', 4, 'Conveniently situated in the Ph?????c M??? part of ???? N???ng, this property puts you close to attractions and interesting dining options. Be sure to set some time aside to visit The Marble Mountains as well as My Khe Beach nearby', 1),
('Sun River Hotel', '132-134-136 Bach Dang Street, Hai Chau District', 'sunriverhotel@gmail.com', '083123456', 4, 'Get your trip off to a great start with a stay at this property, which offers free Wi-Fi in all rooms. Strategically situated in H???i Ch??u, allowing you access and proximity to local attractions and sights', 1),
('Ban Thach Riverside Hotel & Resort', '10 Bach Dang Street, Tam Ky', 'banthach@yahoo.com', '080111111', 3, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Tam Ky part of Tam Ky (Quang Nam), this property puts you close to attractions and interesting dining options', 2),
('Phu Ninh Lake Resort', 'Trung Dan, Tam Dai, Phu Ninh, Tam Ky', 'phuninhlake@gmail.com', '080222222', 3, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Tam Ky part of Tam Ky ', 2),
('Thanh Binh Central Hotel', '98 Ba Trieu Street - Hoi An City', 'thanhbinh@gmail.com', '085555666', 3, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Strategically situated in C???m Ph??, allowing you access and proximity to local attractions and sights', 3),
('Senna Hue Hotel', '7 Nguyen Tri Phuong, Hue City, Hue', 'senna@gmail.com', '081123123', 5, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Strategically situated in Hue City, allowing you access and proximity to local attractions and sights.' , 4),
('White Lotus Hue Hotel', '05-07 Hoang Hoa Tham str., Hue city, Hue City', 'whilelotus@yahoo.com', '081111222', 3, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Strategically situated in Hue City, allowing you access and proximity to local attractions and sights.' , 4);
SELECT * FROM hotel;
-- --------------------------------
DROP TABLE IF EXISTS hotel_service;
CREATE TABLE hotel_service(
id int NOT NULL AUTO_INCREMENT,
hotel_id int DEFAULT NULL,
service_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (hotel_id) REFERENCES hotel (id) ON DELETE CASCADE,
FOREIGN KEY (service_id) REFERENCES service (id) ON DELETE CASCADE
);

INSERT INTO hotel_service (hotel_id, service_id) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,2),
(2,4),
(2,5),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(4,1),
(4,2),
(4,3),
(4,4),
(4,5),
(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(6,1),
(6,2),
(6,3),
(6,4),
(6,5),
(7,1),
(7,2),
(7,3),
(7,4),
(8,1),
(8,2),
(8,3),
(8,5);

SELECT * FROM hotel_service;
-- -----------------------------
DROP TABLE IF EXISTS attraction;
CREATE TABLE attraction (
id int NOT NULL AUTO_INCREMENT,
name varchar(100) DEFAULT NULL,
-- description varchar(255) DEFAULT NULL,
distance decimal(4,2) DEFAULT NULL CHECK (distance > 0 ),
image text DEFAULT NULL,
hotel_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (hotel_id) REFERENCES hotel (id) ON DELETE CASCADE
);
SELECT * FROM attraction;

INSERT INTO attraction (name, distance, hotel_id) VALUES
('Nh?? th??? ?????c B??',10.22,1),
('Ch??? ????m H???nh Th??ng T??y',5.11,1),
('B??u ??i???n trung t??m th??nh ph???',7.62,1),
('B???o t??ng ch???ng t??ch chi???n tranh',11.25,1),
('C??ng vi??n v??n h??a Su???i Ti??n',1.33,1),
('Ch??? B???n Th??nh',2.82,2),
('C???u Ph?? M???',3.14,2),
('Nh?? h??t th??nh ph???',6.55,2),
('B???o t??ng y h???c c??? truy???n',10.16,2),
('C??ng vi??n Tao ????n',9.15,2),
('Th???o C???m Vi??n',7.63,3),
('B???o t??ng tranh 3D',11.48,3),
('?????a ?????o C??? Chi',2.25,3),
('C??ng vi??n n?????c ?????m Sen',4.72,3),
('Landmark 81',1.32,3),
('Ch??a B???u Long',12.82,4),
('Ch??a B?? Thi??n H???u',6.58,4),
('C???u ??nh Sao',4.75,4),
('Khu ???? th??? Ph?? M??? H??ng',5.52,4),
('B???o t??ng l???ch s??? Vi???t Nam',3.11,4),
('H???m Bia',4.78,5),
('Khu du l???ch Su???i M??',9.55,5),
('???????ng s??ch Nguy??n V??n B??nh',11.56,5),
('B???n B???ch ?????ng',5.88,5),
('Khu du l???ch C???n Gi???',2.12,5),
('Ch??? B?? Chi???u',5.82,6),
('H???m Th??? Thi??m',3.12,6),
('B???o t??ng Ph??? N??? Nam B???',10.86,6),
('Ph??? ??i b??? Nguy???n Hu???',4.11,6),
('Khu du l???ch B??nh Qu???i',1.52,6),
('Tu vi???n Kh??nh An',3.65,7),
('Ph??? ng?????i Hoa',7.75,7),
('Ph??? T??y B??i Vi???n',9.98,7),
('H??? ????',1.55,7),
('Dinh ?????c L???p',2.85,7),
('T??a th??p Bitexco',3.11,8),
('H??? con r??a',8.52,8),
('C??ng vi??n n?????c ?????i Th??? Gi???i',7.66,8),
('B???n Nh?? R???ng',10.26,8),
('Nh?? th??? T??n ?????nh',4.42,8);
SELECT * FROM attraction;

-- ---------------------------------
DROP TABLE IF EXISTS review;
CREATE TABLE review (
id int NOT NULL AUTO_INCREMENT,
content varchar(255) DEFAULT NULL,
rate_score decimal(4,2) DEFAULT NULL,
created_date date DEFAULT NULL,
hotel_id int DEFAULT NULL,
user_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (hotel_id) REFERENCES hotel (id) ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
SELECT * FROM review;

INSERT INTO review (content, rate_score, hotel_id, user_id) VALUES 
( 'good', 5, 1, 3 ),
( 'good', 5, 2, 3 ),
( 'good', 5, 3, 3 ),
( 'good', 5, 4, 3 ),
( 'good', 5, 5, 3 ),
( 'good', 5, 6, 3 ),
( 'good', 5, 7, 3 ),
( 'good', 5, 8, 3 ),
( 'quite good', 4, 1, 4 ),
( 'quite good', 4, 2, 4 ),
( 'quite good', 4, 3, 4 ),
( 'quite good', 4, 4, 4 ),
( 'quite good', 4, 5, 4 ),
( 'quite good', 4, 6, 4 ),
( 'quite good', 4, 7, 4 ),
( 'quite good', 4, 8, 4 ),
( 'normal', 3, 1, 5 ),
( 'normal', 3, 2, 5 ),
( 'normal', 3, 3, 5 ),
( 'normal', 3, 4, 5 ),
( 'quite good', 3, 5, 5 ),
( 'quite good', 3, 6, 5 ),
( 'quite good', 3, 7, 5 ),
( 'quite good', 3, 8, 5 ),
( 'bad', 2, 1, 6 ),
( 'bad', 2, 2, 6 ),
( 'bad', 2, 3, 6 ),
( 'bad', 2, 4, 6 );
SELECT * FROM review;

-- ------------------------------
DROP TABLE IF EXISTS room_category;
CREATE TABLE room_category (
id int NOT NULL AUTO_INCREMENT,
room_category varchar(100) DEFAULT NULL,
PRIMARY KEY (id));
INSERT INTO room_category (room_category) VALUES 
('standard'),
('deluxe'),
('family'),
('president');
SELECT * FROM room_category;
-- --------------------------------
DROP TABLE IF EXISTS bed_category;
CREATE TABLE bed_category (
id int NOT NULL AUTO_INCREMENT,
bed_category varchar(100) DEFAULT NULL,
PRIMARY KEY (id));

INSERT INTO  bed_category (bed_category) VALUES 
('single Twin'),
('double Twin'),
('single Queen'),
('double Queen'),
('single King');
SELECT * FROM bed_category;
-- -----------------------
DROP TABLE IF EXISTS room;
CREATE TABLE room (
id int NOT NULL AUTO_INCREMENT,
room_name varchar (100) DEFAULT NULL,
max_occupy_adult int DEFAULT NULL,
max_occupy_child int DEFAULT NULL,
price decimal (10,2) DEFAULT NULL,
hotel_id int DEFAULT NULL,
bed_category_id int DEFAULT NULL,
room_category_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (hotel_id) REFERENCES hotel (id) ON DELETE CASCADE,
FOREIGN KEY (bed_category_id) REFERENCES bed_category (id) ON DELETE CASCADE,
FOREIGN KEY (room_category_id) REFERENCES room_category (id) ON DELETE CASCADE
);
SELECT * FROM room;

INSERT INTO room( hotel_id,room_name,room_category_id, bed_category_id,  max_occupy_adult, max_occupy_child, price) VALUES 
(1,'HA01',1,1,1,1,50),
(1,'HA02',2,2,2,2,75),
(1,'HA03',3,3,2,2,100),
(1,'HA04',3,4,4,4,150),
(1,'HA05',4,5,4,4,400),
(2,'SM01',1,2,2,1,60),
(2,'SM02',2,2,2,2,70),
(2,'SM03',3,3,2,2,120),
(2,'SM04',3,4,4,6,120),
(3,'SR01',1,1,2,2,40),
(3,'SR02',2,1,2,2,30),
(3,'SR03',2,2,4,3,60),
(3,'SR04',3,4,4,6,120),
(3,'SR05',3,3,4,4,80),
(4,'BT01',1,2,2,1,55),
(4,'BT02',2,3,4,2,75),
(4,'BT03',3,4,6,4,125),
(4,'BT04',3,3,4,2,95),
(4,'BT05',4,5,6,6,350),
(5,'PN01',1,1,1,1,35),
(5,'PN02',2,2,4,2,55),
(5,'PN03',3,3,4,2,85),
(5,'PN04',3,4,6,4,105),
(5,'PN05',4,5,8,4,255),
(6,'TB01',2,3,4,2,50),
(6,'TB02',3,4,6,4,100),
(6,'TB03',3,3,4,2,85),
(6,'TB04',2,2,4,2,70),
(7,'SH01',1,2,2,1,40),
(7,'SH02',2,2,4,2,60),
(7,'SH03',3,3,4,2,80),
(7,'SH04',3,4,6,3,100),
(8,'WL01',1,2,2,1,40),
(8,'WL02',2,2,2,1,60),
(8,'WL03',2,3,2,1,80),
(8,'WL04',3,4,4,2,100),
(8,'WL04',4,5,6,3,350);
SELECT * FROM room;

-- SELECT count(*) FROM room;
-- --------------------------
DROP TABLE IF EXISTS voucher;
CREATE TABLE voucher (
id int NOT NULL AUTO_INCREMENT,
voucher_code varchar(100) DEFAULT NULL,
discount_percent int DEFAULT NULL,
expired_date date DEFAULT NULL,
-- appliedDate date DEFAULT NULL,
PRIMARY KEY (id));

INSERT INTO voucher (voucher_code ,
discount_percent ,
expired_date ) VALUES
('SALESOFF', 5, '2023-06-30'),
('ACCOUNT', 10, '2023-12-30'),
('HOLIDAY', 15, '2023-05-30'),
('PROMO20', 20, '2023-09-30'),
('PROMO25', 25, '2023-09-30');
SELECT * FROM voucher;
-- -----------------------------------------------------
-- T???o b???ng calendar_table ????? c?? series ng??y trong 1 n??m
DROP TABLE IF EXISTS calendar_table;
CREATE TABLE calendar_table (
	dt DATE NOT NULL PRIMARY KEY,
	y SMALLINT NULL,
	q tinyint NULL,
	m tinyint NULL,
	d tinyint NULL,
	dw tinyint NULL,
	month_name VARCHAR(9) NULL,
	day_name VARCHAR(9) NULL,
	w tinyint NULL,
	is_weekday BINARY(1) NULL,
	is_holiday BINARY(1) NULL,
	holiday_descr VARCHAR(32) NULL,
	is_payday BINARY(1) NULL
);
DROP TABLE IF EXISTS ints;
CREATE TABLE ints ( i tinyint ); -- ko t???o Entity trong JPA mapping
-- truncate ints;
INSERT INTO ints VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
-- truncate calendar_table ;
INSERT INTO calendar_table (dt)
SELECT DATE('2023-01-01') + INTERVAL a.i*10000 + b.i*1000 + c.i*100 + d.i*10 + e.i DAY
FROM ints a JOIN ints b JOIN ints c JOIN ints d JOIN ints e
WHERE (a.i*10000 + b.i*1000 + c.i*100 + d.i*10 + e.i) <= 364 -- 1 N??M
ORDER BY 1;
SELECT count(*) FROM calendar_table; 
-- ------------------------------------------------------
DROP TABLE IF EXISTS room_dates;
CREATE TABLE room_dates (
id int NOT NULL AUTO_INCREMENT,
dt date DEFAULT NULL, 
room_status int DEFAULT 1, -- 1 or 0
room_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (room_id) REFERENCES room (id) ON DELETE CASCADE,
FOREIGN KEY (dt) REFERENCES calendar_table (dt) ON DELETE CASCADE
);
SELECT * FROM room_dates;

-- D??? li???u ???????c t???o ra t??? ban ?????u 
INSERT INTO room_dates (room_id, dt)
SELECT room.id, calendar_table.dt 
FROM room 
CROSS JOIN calendar_table;
SELECT * FROM room_dates;
-- SELECT count(*) FROM room_dates; -- tested ok
-- --------------------------------------
DROP TABLE IF EXISTS booking;
CREATE TABLE booking ( -- th??ng tin b???ng n??y c???p nh???t t??? ng?????i d??ng/ FORM
id int NOT NULL AUTO_INCREMENT,
user_id int DEFAULT NULL,
check_in date DEFAULT NULL,
check_out date DEFAULT NULL, 
adult_number int DEFAULT NULL,
child_number int DEFAULT NULL,
voucher_id int DEFAULT NULL, 
issued_date date DEFAULT NULL,
paid_date date DEFAULT NULL,
cancel_date date DEFAULT NULL, 
booking_status varchar (100) DEFAULT NULL, -- open, complete, cancel
total_price decimal (10,2) DEFAULT NULL,
payment_method varchar(100) DEFAULT NULL,
payment_date date DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (voucher_id) REFERENCES voucher (id) ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
SELECT * FROM booking;

-- C???N B??? SUNG TH??M C??U L???NH INSERT 1 BOOKING ???????C TH???C HI???N T???O 1 BOOKING
-- -------------------------------
DROP TABLE IF EXISTS bill; -- ch??? y???u replicate d??? li???u t??? b???ng Booking v?? 1 s??? th??ng tin t??? Input
CREATE TABLE bill (
id int NOT NULL AUTO_INCREMENT,
booking_id int DEFAULT NULL,
user_id int DEFAULT NULL,
full_name varchar (255) DEFAULT NULL,
payment_date date DEFAULT NULL,
payment_total decimal (10,2) DEFAULT NULL,
payment_method varchar(100) DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
SELECT * FROM bill;

-- C???N B??? SUNG TH??M C??U L???NH INSERT 1 BOOKING ???????C TH???C HI???N THANH TO??N
-- -----------------------------------
DROP TABLE IF EXISTS booking_room;
CREATE TABLE booking_room ( -- d??? li???u c???t offerStatus s??? ???????c update t??? b???ng offer_status 
id int NOT NULL AUTO_INCREMENT,
check_in date DEFAULT NULL, -- l???y t??? Booking
check_out date DEFAULT NULL, -- l???y t??? Booking
room_name varchar (100) DEFAULT NULL,
price decimal (10,2) DEFAULT NULL, -- l???y t??? room
offer_status int DEFAULT 0, -- 1 (available) or 0 (unavailable)
chosen_status int DEFAULT 0, -- 1 (KH ch???n) or 0 (ko ch???n)
booking_id int DEFAULT NULL ,
room_id int DEFAULT NULL,
hotel_id int DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE,
FOREIGN KEY (room_id) REFERENCES room (id) ON DELETE CASCADE,
FOREIGN KEY (hotel_id) REFERENCES hotel (id) ON DELETE CASCADE
);
-- --------------------------------------
DROP TABLE IF EXISTS booking_room_dates;
CREATE TABLE booking_room_dates (
id int NOT NULL AUTO_INCREMENT,
room_dates_id int DEFAULT NULL, 
room_id int DEFAULT NULL,
dt date DEFAULT NULL,
room_status int DEFAULT NULL,
booking_id int DEFAULT NULL,
check_in date DEFAULT NULL,
check_out date DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE,
FOREIGN KEY (room_dates_id) REFERENCES room_dates (id) ON DELETE CASCADE
);
-- -------------------------------
DROP TABLE IF EXISTS offer_status;
CREATE TABLE offer_status ( -- d??? li???u ???????c t???o t??? query
id int NOT NULL AUTO_INCREMENT,
booking_id int  ,-- l???y t??? booking_room_dates
room_id int DEFAULT NULL, -- l???y t??? booking_room_dates
offer_status int DEFAULT NULL, -- t??nh to??n t??? booking_room_dates
PRIMARY KEY (id));





/*
-- ------------ DATABASE CREATION ENDS HERE -----------------
-- ----------------------------------------------------------
-- ------------------------------- --------------------------
-- Query d??ng ????? update d??? li???u b???ng BOOKING_ROOM (OFFER) sau khi insert d??? li???u m???i v??o b???ng BOOKING
INSERT INTO booking_room (bookingId, checkIn, checkOut, roomId, hotelId, roomName, price) 
SELECT b.Id, b.checkIn, b.checkOut, r.Id, r.hotelId, r.roomName, r.price
FROM booking AS b
CROSS JOIN room AS r;
-- WHERE bookingId = ?; -- l???y th??ng tin t??? ng?????i d??ng
SELECT * FROM booking_room;
-- ---------------------------------------
-- insert th??ng tin b???ng query cho b???ng n??y
-- DROP TABLE IF EXISTS booking_room_dates;
-- CREATE TABLE booking_room_dates (
-- id int NOT NULL AUTO_INCREMENT,
-- roomDatesId int DEFAULT NULL, 
-- roomId int DEFAULT NULL,
-- dt date DEFAULT NULL,
-- roomStatus int DEFAULT NULL,
-- bookingId int DEFAULT NULL,
-- checkIn date DEFAULT NULL,
-- checkOut date DEFAULT NULL,
-- FOREIGN KEY (bookingId) REFERENCES booking (id),
-- FOREIGN KEY (roomDatesId) REFERENCES room_dates (id),
-- PRIMARY KEY (id));

-- Query d??ng ????? update d??? li???u b???ng booking_room_dates sau khi insert d??? li???u m???i v??o b???ng BOOKING
-- b???ng n??y c?? th??? x??a d??? li???u ??i sau khi t??nh to??n
INSERT INTO booking_room_dates (roomDatesId, roomId, dt, roomStatus, bookingId, checkIn, checkOut) 
SELECT r.id, r.roomId, r.dt, r.roomStatus, b.id, b.checkIn, b.checkOut
FROM booking AS b
CROSS JOIN room_dates AS r
WHERE r.dt >= b.checkIn AND r.dt <= b.checkOut;
-- AND bookingId = ?; -- l???y th??ng tin t??? ng?????i d??ng
SELECT * FROM booking_room_dates;
-- ------------------------------
-- b???ng n??y c?? th??? x??a d??? li???u ??i sau khi t??nh to??n
-- DROP TABLE IF EXISTS offer_status;
-- CREATE TABLE offer_status ( -- d??? li???u ???????c t???o t??? query
-- id int NOT NULL AUTO_INCREMENT,
-- bookingId int  ,-- l???y t??? booking_room_dates
-- roomId int DEFAULT NULL, -- l???y t??? booking_room_dates
-- offerStatus int DEFAULT NULL, -- t??nh to??n t??? booking_room_dates
-- PRIMARY KEY (id));

-- t??nh to??n ????? ki???m tra m???i offer c?? available hay kh??ng
INSERT INTO offer_status (bookingId, roomId, offerStatus)
SELECT 
	  b.bookingId
	, b.roomId
    , CASE WHEN sum(roomStatus) OVER (partition by b.bookingId , b.roomId)  = count(roomStatus) OVER (partition by b.bookingId , b.roomId) THEN 1 ELSE 0 END AS offerStatus
FROM booking_room_dates b;
SELECT * FROM offer_status;

UPDATE booking_room
INNER JOIN offer_status 
ON booking_room.bookingId = offer_status.bookingId
AND  booking_room.roomId = offer_status.roomId
SET booking_room.offerStatus = offer_status.offerStatus;
-- WHERE booking_room.bookingId = 1; -- ? -- l???y th??ng tin t??? ng?????i d??ng
-- ??ang t???t safe mode

SELECT * FROM booking_room;
*/