-- 6 - Find the percentage of 5-star reviews for each business

SELECT 
    b.business_id,
    b.name,
    COUNT(*) AS total_reviews,
    SUM(
        CASE 
            WHEN r.review_stars = 5 THEN 1 
            ELSE 0 
        END
    ) AS star5_reviews
FROM tbl_yelp_reviews r
INNER JOIN tbl_yelp_businesses b
    ON r.business_id = b.business_id
GROUP BY 1, 2;