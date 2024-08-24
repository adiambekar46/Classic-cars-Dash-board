use classicmodels;
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;

select * from customers c left join payments p on c.customerNumber= p.customerNumber
left join orders o on c.customerNumber=o.customerNumber
where c.salesRepEmployeeNumber is null;


Select Year(orderDate), sum(orderNumber) from orders
where status="Shipped"
group by 1 order by 1;

Select Year(paymentDate), sum(amount) from payments group by 1 order by Year(paymentDate);

Select a.productLine, sum(c.quantityOrdered),sum(c.quantityOrdered*c.priceEach) from productlines a inner join products b on a.productLine=b.productLine
inner join orderdetails c on b.productCode=c.productCode
group by 1;

Select a.productLine,d.shippedDate, sum(c.quantityOrdered),sum(c.quantityOrdered*c.priceEach) from productlines a inner join products b on a.productLine=b.productLine
inner join orderdetails c on b.productCode=c.productCode
right join orders d on c.orderNumber=d.orderNumber
where d.shippedDate is null
group by a.productLine,d.shippedDate;