CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    gender VARCHAR(10),
    salary NUMERIC(10, 2),
    post VARCHAR(50),
    department VARCHAR(50),
    date_of_joining DATE,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
	)
	
select * from employee

CREATE TABLE factory (
    factory_id SERIAL PRIMARY KEY,
    emp_id INT NOT NULL,
    factory_name VARCHAR(100),
    location VARCHAR(100),
    established_year INT,
	profit numeric(10,2),
    production_type VARCHAR(100),
    total_employees INT,
    area_sqft NUMERIC(10, 2)
	)

select * from factory

	CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10, 2),
    manufacture_date DATE,
    expiry_date DATE,
    factory_id INT NOT NULL,
    qty INT NOT NULL 
);

select * from product

-------VIEWS
1)
create view Factory_data as select sum(f.profit) as Total_profit ,f.location,f.factory_name,p.category,sum(p.price)as Total_price,sum(p.price)/sum(p.qty) as Avg_price_per_qty ,avg(e.salary) as Avg_salary ,e.post from factory as f
inner join product as p
on f.factory_id=p.factory_id
inner join employee as e
on f.emp_id=e.emp_id
where post='Manager'
group by f.location,f.factory_name,p.category,e.post  
order by total_profit asc;

select * from factory_data


-- 2)
create view Statement as select sum(f.profit) as Total_profit ,f.location,f.factory_name,p.category,
sum(p.price)as Total_price,sum(p.price)/sum(p.qty) as Avg_price_per_qty ,avg(e.salary) as Avg_salary ,e.post from factory as f
inner join product as p
on f.factory_id=p.factory_id
inner join employee as e
on f.emp_id=e.emp_id
group by f.location,f.factory_name,p.category,e.post  
having sum(p.price)>200
order by total_profit desc

select * from statement

-- 3)


create view Automobile as select avg(f.profit) as AVg_profit ,f.location,f.factory_name,p.category,
Avg(p.price)as Avg_price,sum(p.price)/sum(p.qty) as Avg_price_per_qty ,avg(e.salary) as Avg_salary ,e.post from factory as f
inner join product as p
on f.factory_id=p.factory_id
inner join employee as e
on f.emp_id=e.emp_id
where category ='Automobile'
group by f.location,f.factory_name,p.category,e.post  
having avg(p.price)>200
order by Avg_profit desc

select * from automobile

 
-- 4)

create view State_book as select avg(f.profit) as AVg_profit ,f.location,f.factory_name,p.category,
Avg(p.price)as Avg_price,sum(p.price)/sum(p.qty) as Avg_price_per_qty ,avg(e.salary) as Avg_salary ,e.post from factory as f
inner join product as p
on f.factory_id=p.factory_id
inner join employee as e
on f.emp_id=e.emp_id
group by f.location,f.factory_name,p.category,e.post  


select * from state_book