-- 4 - Find the top 3 most recent reviews for each business

WITH cte AS (
    SELECT 
        r.*,
        b.name,
        ROW_NUMBER() OVER (
            PARTITION BY r.business_id 
            ORDER BY review_date DESC
        ) AS rn
    FROM tbl_yelp_reviews r
    INNER JOIN tbl_yelp_businesses b
        ON r.business_id = b.business_id
)
SELECT *
FROM cte
WHERE rn <= 3;