-- 10 - Find top 10 businesses with highest positive sentiment reviews

SELECT 
    r.business_id,
    b.name,
    COUNT(*) AS total_reviews
FROM tbl_yelp_reviews r
INNER JOIN tbl_yelp_businesses b 
    ON r.business_id = b.business_id
WHERE sentiments = 'Positive'
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10;