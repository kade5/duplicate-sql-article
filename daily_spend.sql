create table person
(
    person_id  VARCHAR(40),
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(50)
);
insert into person (person_id, first_name, last_name, email)
values ('1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', 'Celeste', 'Waistell', 'cwaistell0@cpanel.net');
insert into person (person_id, first_name, last_name, email)
values ('0a382cd7-f966-45f5-9bba-2b755fd07800', 'Kerwin', 'Ivashnyov', 'kivashnyov1@illinois.edu');
insert into person (person_id, first_name, last_name, email)
values ('1920efde-78eb-4588-82b7-699d5692b1b7', 'Reece', 'Swalowe', 'rswalowe2@dmoz.org');
insert into person (person_id, first_name, last_name, email)
values ('3e059f41-9117-4676-9de1-ac6bf2876cbd', 'Carr', 'Scarborough', 'cscarborough3@odnoklassniki.ru');
insert into person (person_id, first_name, last_name, email)
values ('2e961b01-baf1-4730-985f-6b926695bf09', 'Jayne', 'Miner', 'jminer4@qq.com');
insert into person (person_id, first_name, last_name, email)
values ('9fe8957e-6fa5-414d-a6fe-0e0be8d03ded', 'Jane', 'Miner', 'jminer4@qq.com');

create table spend
(
    id           INT,
    person_id    CHAR(36),
    receipt_date DATE,
    item         VARCHAR(50),
    cost         DECIMAL(10, 2)
);
insert into spend (id, person_id, receipt_date, item, cost)
values (1, '2e961b01-baf1-4730-985f-6b926695bf09', '12/2/2024', 'Wine - Red, Colio Cabernet', 5.88);
insert into spend (id, person_id, receipt_date, item, cost)
values (2, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/2/2024', 'Plate Foam Laminated 9in Blk', 7.3);
insert into spend (id, person_id, receipt_date, item, cost)
values (3, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/1/2024', 'Truffle Shells - Semi - Sweet', 5.24);
insert into spend (id, person_id, receipt_date, item, cost)
values (4, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/2/2024', 'Bols Melon Liqueur', 3.97);
insert into spend (id, person_id, receipt_date, item, cost)
values (5, '2e961b01-baf1-4730-985f-6b926695bf09', '12/6/2024', 'Trout - Rainbow, Frozen', 2.44);
insert into spend (id, person_id, receipt_date, item, cost)
values (6, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/6/2024', 'Chicken Breast Halal', 3.89);
insert into spend (id, person_id, receipt_date, item, cost)
values (7, '3e059f41-9117-4676-9de1-ac6bf2876cbd', '12/5/2024', 'Plastic Wrap', 9.51);
insert into spend (id, person_id, receipt_date, item, cost)
values (8, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/3/2024', 'Cup - 3.5oz, Foam', 2.6);
insert into spend (id, person_id, receipt_date, item, cost)
values (9, '0a382cd7-f966-45f5-9bba-2b755fd07800', '12/6/2024', 'Gatorade - Orange', 9.52);
insert into spend (id, person_id, receipt_date, item, cost)
values (10, '1920efde-78eb-4588-82b7-699d5692b1b7', '12/1/2024', 'Wine - Barbera Alba Doc 2001', 9.64);
insert into spend (id, person_id, receipt_date, item, cost)
values (11, '0a382cd7-f966-45f5-9bba-2b755fd07800', '12/2/2024', 'Quiche Assorted', 7.3);
insert into spend (id, person_id, receipt_date, item, cost)
values (12, '2e961b01-baf1-4730-985f-6b926695bf09', '12/3/2024', 'Bread - Multigrain, Loaf', 2.77);
insert into spend (id, person_id, receipt_date, item, cost)
values (13, '3e059f41-9117-4676-9de1-ac6bf2876cbd', '12/2/2024', 'The Pop Shoppe Pinapple', 8.14);
insert into spend (id, person_id, receipt_date, item, cost)
values (14, '9fe8957e-6fa5-414d-a6fe-0e0be8d03ded', '12/6/2024', 'Edible Flower - Mixed', 8.94);
insert into spend (id, person_id, receipt_date, item, cost)
values (15, '2e961b01-baf1-4730-985f-6b926695bf09', '12/3/2024', 'Table Cloth - 53x69 Colour', 9.7);
insert into spend (id, person_id, receipt_date, item, cost)
values (16, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/5/2024', 'Thyme - Fresh', 7.2);
insert into spend (id, person_id, receipt_date, item, cost)
values (17, '3e059f41-9117-4676-9de1-ac6bf2876cbd', '12/4/2024', 'Pasta - Tortellini, Fresh', 2.9);
insert into spend (id, person_id, receipt_date, item, cost)
values (18, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/4/2024', 'Sauce - Bernaise, Mix', 2.02);
insert into spend (id, person_id, receipt_date, item, cost)
values (19, '0a382cd7-f966-45f5-9bba-2b755fd07800', '12/4/2024', 'Sesame Seed', 7.27);
insert into spend (id, person_id, receipt_date, item, cost)
values (20, '9fe8957e-6fa5-414d-a6fe-0e0be8d03ded', '12/3/2024', 'Wine - Valpolicella Masi', 7.25);
insert into spend (id, person_id, receipt_date, item, cost)
values (21, '2e961b01-baf1-4730-985f-6b926695bf09', '12/4/2024', 'Longos - Grilled Veg Sandwiches', 8.17);
insert into spend (id, person_id, receipt_date, item, cost)
values (22, '2e961b01-baf1-4730-985f-6b926695bf09', '12/5/2024', 'Potatoes - Purple, Organic', 6.66);
insert into spend (id, person_id, receipt_date, item, cost)
values (23, '9fe8957e-6fa5-414d-a6fe-0e0be8d03ded', '12/4/2024', 'Tea - Orange Pekoe', 3.56);
insert into spend (id, person_id, receipt_date, item, cost)
values (24, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/4/2024', 'Mace', 7.85);
insert into spend (id, person_id, receipt_date, item, cost)
values (25, '1920efde-78eb-4588-82b7-699d5692b1b7', '12/6/2024', 'Lentils - Green Le Puy', 2.74);
insert into spend (id, person_id, receipt_date, item, cost)
values (26, '9fe8957e-6fa5-414d-a6fe-0e0be8d03ded', '12/4/2024', 'Longos - Burritos', 7.3);
insert into spend (id, person_id, receipt_date, item, cost)
values (27, '9fe8957e-6fa5-414d-a6fe-0e0be8d03ded', '12/5/2024', 'Veal - Slab Bacon', 8.24);
insert into spend (id, person_id, receipt_date, item, cost)
values (28, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/1/2024', 'Marzipan 50/50', 8.27);
insert into spend (id, person_id, receipt_date, item, cost)
values (29, '1920efde-78eb-4588-82b7-699d5692b1b7', '12/5/2024', 'Cucumber - English', 7.61);
insert into spend (id, person_id, receipt_date, item, cost)
values (30, '3e059f41-9117-4676-9de1-ac6bf2876cbd', '12/5/2024', 'Bread - Assorted Rolls', 9.03);

create table reversed
(
    id           INT,
    person_id    CHAR(36),
    receipt_date DATE,
    item         VARCHAR(50),
    cost         DECIMAL(10, 2)
);
insert into reversed (id, person_id, receipt_date, item, cost)
values (4, '1d31e93d-7f6c-49bb-bbe2-4a01cb3ee501', '12/2/2024', 'Bols Melon Liqueur', -3.97);
insert into reversed (id, person_id, receipt_date, item, cost)
values (10, '1920efde-78eb-4588-82b7-699d5692b1b7', '12/1/2024', 'Wine - Barbera Alba Doc 2001', -9.64);


create table daily_user_spend
(
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100),
    the_date    DATE,
    total_spend DECIMAL(10, 2)
);

with totals as (select p.email,
                       s.receipt_date as the_day,
                       sum(cost)         total_spend
                from person p
                         inner join spend s on p.person_id = s.person_id
                group by s.receipt_date, p.email
                UNION ALL

                select p.email,
                       r.receipt_date as the_day,
                       sum(cost)         total_spend
                from person p
                         inner join reversed r on p.person_id = r.person_id
                group by r.receipt_date, p.email)
insert into daily_user_spend
select p.first_name,
       p.last_name,
       p.email,
       t.the_day,
       t.total_spend
from person p
         inner join totals t on p.email = t.email;

select *
from daily_user_spend;
