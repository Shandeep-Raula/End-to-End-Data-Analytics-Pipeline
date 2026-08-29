-- 7 - Find the top 5 most reviewed businesses in each city

WITH cte AS (
    SELECT 
        b.city,
        b.business_id,
        b.name,
        COUNT(*) AS total_reviews,
        ROW_NUMBER() OVER (
            PARTITION BY b.city
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM tbl_yelp_reviews r
    INNER JOIN tbl_yelp_businesses b
        ON r.business_id = b.business_id
    GROUP BY 1, 2, 3
)
SELECT *
FROM cte
WHERE rn <= 5;