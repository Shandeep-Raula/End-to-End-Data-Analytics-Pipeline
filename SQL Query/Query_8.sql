-- 8 - Find the average rating of businesses
--     that have at least 100 reviews

SELECT 
    b.business_id,
    b.name,
    COUNT(*) AS total_reviews,
    AVG(r.review_stars) AS average_rating
FROM tbl_yelp_reviews r
INNER JOIN tbl_yelp_businesses b
    ON r.business_id = b.business_id
GROUP BY 1, 2
HAVING COUNT(*) >= 100;