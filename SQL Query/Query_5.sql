-- 5 - Find the month with the highest number of reviews

SELECT 
    MONTH(review_date) AS review_month,
    COUNT(*) AS no_of_reviews
FROM tbl_yelp_reviews
GROUP BY 1
ORDER BY 2 DESC;