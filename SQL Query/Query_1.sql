-- 1 - Find number of businesses in each category
-- SELECT * FROM tbl_yelp_reviews LIMIT 10;

WITH cte AS (
    SELECT 
        business_id,
        TRIM(A.value) AS category
    FROM tbl_yelp_businesses,
    LATERAL SPLIT_TO_TABLE(categories, ',') A
)
SELECT 
    category,
    COUNT(*) AS no_of_business
FROM cte
GROUP BY 1;