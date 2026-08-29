-- 9 - List the top 10 users who have written the most reviews,
--     along with the businesses they reviewed

WITH cte AS (
    SELECT 
        r.user_id,
        COUNT(*) AS total_reviews
    FROM tbl_yelp_reviews r
    INNER JOIN tbl_yelp_businesses b
        ON r.business_id = b.business_id
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 10
)
SELECT *
FROM tbl_yelp_reviews
WHERE user_id IN (
    SELECT user_id 
    FROM cte
)
ORDER BY user_id;