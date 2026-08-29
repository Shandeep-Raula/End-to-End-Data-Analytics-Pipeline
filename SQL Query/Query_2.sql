-- 2 - Find the top 10 users who have reviewed the most businesses
--    in the "Restaurants" category

SELECT 
    r.user_id,
    COUNT(DISTINCT r.business_id) AS no_of_business
FROM tbl_yelp_reviews r
INNER JOIN tbl_yelp_businesses b
    ON r.business_id = b.business_id
WHERE b.categories ILIKE '%Restaurants%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;