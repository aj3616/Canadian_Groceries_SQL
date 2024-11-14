-- SQL Script to Analyze Vendor Impact on Pricing
-- Drop tables if they exist to ensure a fresh start
DROP TABLE IF EXISTS product_raw_data;
DROP TABLE IF EXISTS vendor_brand_pricing;
DROP TABLE IF EXISTS brand_price_differences;
DROP TABLE IF EXISTS vendor_summary;

-- Join the product and raw tables to bring all relevant data together
CREATE TEMP TABLE product_raw_data AS
SELECT 
    p.id AS product_id,
    p.vendor,
    p.brand,
    p.product_name,
    r.current_price,
    r.old_price,
    r.price_per_unit
FROM 
    product p
JOIN 
    raw r
ON 
    p.id = r.product_id
WHERE 
    p.product_name LIKE '%bread%'; -- Filter only bread products

-- Calculate average prices per vendor and brand
CREATE TEMP TABLE vendor_brand_pricing AS
SELECT 
    vendor,
    brand,
    AVG(current_price) AS avg_current_price,
    AVG(price_per_unit) AS avg_price_per_unit,
    COUNT(*) AS product_count
FROM 
    product_raw_data
GROUP BY 
    vendor, brand;

-- Find price differences for the same brand across vendors
CREATE TEMP TABLE brand_price_differences AS
SELECT 
    b1.brand,
    b1.vendor AS vendor1,
    b2.vendor AS vendor2,
    ABS(b1.avg_current_price - b2.avg_current_price) AS price_difference,
    ABS(b1.avg_price_per_unit - b2.avg_price_per_unit) AS unit_price_difference
FROM 
    vendor_brand_pricing b1
JOIN 
    vendor_brand_pricing b2
ON 
    b1.brand = b2.brand AND b1.vendor < b2.vendor
WHERE 
    b1.product_count > 1 AND b2.product_count > 1; -- Ensure meaningful comparisons

-- Aggregate overall findings by vendor
CREATE TEMP TABLE vendor_summary AS
SELECT 
    vendor,
    AVG(avg_current_price) AS overall_avg_price,
    AVG(avg_price_per_unit) AS overall_avg_unit_price
FROM 
    vendor_brand_pricing
GROUP BY 
    vendor;

-- Results for analysis
-- Vendor-Brand Pricing Averages
SELECT * FROM vendor_brand_pricing;

-- Price Differences Across Vendors for the Same Brand
SELECT * FROM brand_price_differences;

-- Overall Vendor Summary
SELECT * FROM vendor_summary;
