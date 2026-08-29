-- 3 - Find the most popular categories of businesses
--     based on the number of reviews

WITH cte AS (
    SELECT 
        business_id,
        TRIM(A.value) AS category
    FROM tbl_yelp_businesses,
    LATERAL SPLIT_TO_TABLE(categories, ',') A
)
SELECT 
    category,
    COUNT(*) AS no_of_reviews
FROM cte
INNER JOIN tbl_yelp_reviews r
    ON cte.business_id = r.business_id
GROUP BY 1
ORDER BY 2 DESC;