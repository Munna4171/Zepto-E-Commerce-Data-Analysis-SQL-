drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

select * from zepto limit 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

 --different product categories
select distinct category from zepto order by category;

--products in stock vs out of stock
select outofstock ,count(sku_id) from zepto group by outofstock;

--product names present multiple times
select name ,count(sku_id) from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

--data cleaning
select * from zepto where mrp = 0 or discountedSellingPrice = 0;

delete from zepto where sku_id = 3607;
-- or
DELETE FROM zepto WHERE mrp = 0;

--convert paise to rupees
update zepto set mrp = mrp/100.0, discountedSellingPrice = discountedSellingPrice/100.0;

select * from zepto limit 10;

--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name, mrp, discountPercent  from zepto 
order by discountPercent desc limit 10;

-- Q2. What are the Products with High MRP but Out of Stock

select distinct name, mrp from zepto 
where mrp >300 and outofstock = True
order by mrp desc;

-- Q3. Calculate Estimated Revenue for each category

select category, sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name, mrp,discountPercent from zepto where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select category, round(avg(discountPercent),2) as avg_dis from zepto
group by category
order by avg_dis desc
limit 5; 

-- Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name, weightingms, discountedsellingprice, round(discountedsellingprice/weightingms,2) as price_per_grms
from zepto
where weightingms > 100
order by price_per_grms;

--Q7. Group the products into categories like Low, Medium, Bulk.

select distinct name, weightingms,
case when weightingms <1000 then 'LOW'
when weightingms <5000 then 'medium'
else 'Bulk'
end as weighted_category from zepto;

--Q8. What is the Total Inventory Weight Per Category 

select distinct category, Sum(weightingms * availablequantity) as weight_per_grams
from zepto 
group by category
order by weight_per_grams;

-- Q9. Supply Chain Bottleneck: Which category has the most "Out of Stock" items?

select distinct category, count(*) as out_off_stock
from zepto
where outofstock = True
group by category
order by out_off_stock desc;

-- Q10. Emergency Restock List: Which products have "Dangerously Low" stock?

select name, category, availablequantity from zepto
where availablequantity < 5
order by availablequantity;







