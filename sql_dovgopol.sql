insert into "Couriers"(login, "passwordHash", "firstName", "createdAt", "updatedAt") values('denis', 'pa
sswordHash', 'denis', current_date, current_date);

insert into "Couriers"(login, "passwordHash", "firstName", "createdAt", "updatedAt") values('andrei', 'pa
sswordHash', 'andrei', current_date, current_date);

select * from "Couriers";

--orders for andrei. 2 are in delivery
insert into "Orders"("courierId" , "firstName" , "lastName" , "address" , "metroStation" , phone , "rentTime" , "deliveryDate" , track , "inDelivery" , cancelled , finished , "createdAt" , "updatedAt") values (4, 'Ivanov', 'Ivan', 'address', 'metroStation', '123456789', 10, current_date, '1', true, false, false, current_date, current_date);

insert into "Orders"("courierId" , "firstName" , "lastName" , "address" , "metroStation" , phone , "rentTime" , "deliveryDate" , track , "inDelivery" , cancelled , finished , "createdAt" , "updatedAt") values (4, 'Ivanov', 'Ivan', 'address', 'metroStation', '123456789', 10, current_date, '1', true, false, false, current_date, current_date);

--orders for denis. 2 are in delivery
insert into "Orders"("courierId" , "firstName" , "lastName" , "address" , "metroStation" , phone , "rentTime" , "deliveryDate" , track , "inDelivery" , cancelled , finished , "createdAt" , "updatedAt") values (3, 'Ivanov', 'Ivan', 'address', 'metroStation', '123456789', 10, current_date, '1', true, false, false, current_date, current_date);

insert into "Orders"("courierId" , "firstName" , "lastName" , "address" , "metroStation" , phone , "rentTime" , "deliveryDate" , track , "inDelivery" , cancelled , finished , "createdAt" , "updatedAt") values (3, 'Ivanov', 'Ivan', 'address', 'metroStation', '123456789', 10, current_date, '1', true, false, false, current_date, current_date);

insert into "Orders"("courierId" , "firstName" , "lastName" , "address" , "metroStation" , phone , "rentTime" , "deliveryDate" , track , "inDelivery" , cancelled , finished , "createdAt" , "updatedAt") values (3, 'Ivanov', 'Ivan', 'address', 'metroStation', '123456789', 10, current_date, '1', false, false, true, current_date, current_date);

select * from "Orders";

--TASK 1
select count(*) as orders_in_delivery, c.login as courier from "Orders" o
    left join "Couriers" c on o."courierId" = c.id
    where o."inDelivery" is true group by (c.login);

--TASK 2
select o.track, case
		when o.finished is true then 2 
		when o.cancelled is true then -1
		when o."inDelivery" is true then 1
		end
		as status
from "Orders" o;